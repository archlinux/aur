# Maintainer: sinomor
pkgname=delta-shell-git
pkgver=r218.4d623ce
pkgrel=1
pkgdesc="A Desktop Shell for Niri and Hyprland"
arch=('x86_64')
url="https://github.com/sinomor/delta-shell"
license=('MIT')
depends=(
    # official repository:
    'wireplumber'
    'networkmanager'
    'dart-sass'
    'wl-clipboard'
    'upower'
    'libadwaita'
    # aur:
    'aylurs-gtk-shell-git'
    'libastal-meta'
    'libastal-niri-git'
)
makedepends=(
    'meson'
    'unzip'
    'git'
    'npm'
)
optdepends=(
    'cliphist: for clipboard history'
    'gpu-screen-recorder: for recording screen'
    'geoclue: for autoload the location for weather'
    'brightnessctl: for control brightness of monitors'
    'power-profiles-daemon: switch power profiles'
    'bluez: for connect to bluetooth devices'
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/delta-shell"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/delta-shell"

    npm install
}

build() {
    cd "$srcdir/delta-shell"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$srcdir/delta-shell"

    meson install -C build --destdir "$pkgdir"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
