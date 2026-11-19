#!/usr/bin/env bash

set -euo pipefail

MOUNT_DIRS=(
    $HOME/.dotnet
    $HOME/.nuget
    "/commandhistory"
    "/mnt/mise-data"
)

for DIR in "${MOUNT_DIRS[@]}"; do
    sudo chown -R $(whoami): $DIR
done

touch /commandhistory/.zsh_history
rm -f $HOME/.zsh_history && ln -s /commandhistory/.zsh_history ~/.zsh_history

mise trust
mise install -y

exit 0
