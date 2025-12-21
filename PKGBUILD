# Maintainer: sinomor
pkgname=delta-shell
pkgver=0.1
pkgrel=1
pkgdesc="A Desktop Shell for Niri and Hyprland"
arch=('x86_64')
url="https://github.com/sinomor/$pkgname"
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
    'libgtop: for cpu usage'
)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('757a80e9040d5a549ad724e4e4365a1a9dfe29268b8182ef561a37364b6ef065')
conflicts=('delta-shell-git')

prepare() {
    cd "$_archive"

    npm install
}

build() {
    cd "$_archive"

    arch-meson build
    meson compile -C build
}

package() {
    cd "$_archive"

    meson install -C build --destdir "$pkgdir"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
