# Maintainer: João Dias <joaovodias at gmail dot com>
# SPDX-FileCopyrightText: 2026 João Dias <joaovodias at gmail dot com>
#
# SPDX-License-Identifier: 0BSD


pkgname="colorshell-git"
_pkgname=${pkgname%-git}
pkgdesc="A super \"coolorful\" shell for Hyprland! (latest-commit version)"
license=('BSD-3-Clause')
url="https://github.com/retrozinndev/colorshell"
pkgrel=1
pkgver=2.1.2.r128.g446ecbc
arch=('any')
sha256sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
    "$_pkgname::git+https://github.com/retrozinndev/$_pkgname.git"
)
makedepends=(
    'git'
    'pnpm'
    'jq'
    'aylurs-gtk-shell'
)
depends=(
    'gjs'
    'hyprland'
    'hyprpaper'
    'procps-ng'
    'cliphist'
    'socat'
    'gobject-introspection-runtime'
    'wireplumber'
    'glycin'
    'glycin-gtk4'
    'networkmanager'
    'pipewire'
    'python-pywal16'
    'bash'
    'libastal-4'
    'libastal-io'
    'libastal-apps'
    'libastal-battery'
    'libastal-bluetooth'
    'libastal-hyprland'
    'libastal-mpris'
    'libastal-network'
    'libastal-notifd'
    'libastal-tray'
    'libastal-wireplumber'
)
optdepends=(
    'hyprlock: for the "colorshell lock" command'
    'hyprpicker: for the color picker in the control center'
    'hyprsunset: apply light filters from the control center'
    'ttf-nerd-fonts-symbols-mono: icon glyphs for hyprlock'
    'nm-connection-editor: ui to edit network connections'
    'grim: take screenshots with colorshell commands'
    'slurp: needed to select screenshot area'
)


pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed -E 's/(.*)-([0-9]*)-(.*)/\1.r\2.\3/g'
}

prepare() {
    cd "$_pkgname"
    pnpm install
}

build() {
    cd "$_pkgname"
    pnpm build -rg "/usr/share/colorshell/resources.gresource" -o build
}

package() {
    cd "$_pkgname"
    install -Dm 755 build/colorshell "$pkgdir/usr/bin/colorshell"
    install -Dm 644 build/resources.gresource "$pkgdir/usr/share/colorshell/resources.gresource"
}
