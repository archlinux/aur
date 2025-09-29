# Maintainer: John Oberhauser <j.aur@obez.io>
pkgname=okpanel-git
pkgver=0.1.0
pkgrel=13
pkgdesc="A custom AGS panel for hyprland"
license=('GPL3')
arch=('any')
url="https://github.com/JohnOberhauser/OkPanel"
depends=(
    'aylurs-gtk-shell-git'
    'bluez'
    'bluez-utils'
    'brightnessctl'
    'cava'
    'cliphist'
    'dart-sass'
    'go-yq'
    'grim'
    'gvfs'
    'jq'
    'hyprland'
    'hyprsunset'
    'hyprpicker'
    'libastal-meta'
    'libnotify'
    'networkmanager'
    'pipewire-pulse'
    'power-profiles-daemon'
    'slurp'
    'sox'
    'ttf-jetbrains-mono-nerd'
    'upower'
    'wf-recorder'
    'wireplumber'
    'wl-clipboard'
)
makedepends=('rsync')
source=("git+$url.git")
sha256sums=("SKIP")

package() {
    cd "$srcdir/$(basename "$url")"

    install -Dm755 bin/okpanel "$pkgdir/usr/bin/okpanel"
    install -Dm755 bin/okpanel-share "$pkgdir/usr/bin/okpanel-share"

    mkdir -p "$pkgdir/usr/share/okpanel"
    rsync -a --exclude='@girs' --exclude='node_modules' ags/ "$pkgdir/usr/share/okpanel/"
}
