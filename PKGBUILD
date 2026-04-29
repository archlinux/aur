# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu
pkgver=1.1.1
pkgrel=1
pkgdesc="An all-in-one Muslim app for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/sniper1720/khushu"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs' 'geoclue2' 'alsa-lib' 'ttf-amiri')
optdepends=('xdg-desktop-portal: autostart portal support')
options=(!debug)
makedepends=('cargo' 'gettext' 'meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sniper1720/khushu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c2efba738739b264078cbfc587b8b0dce0409e9d9c8d53b81b1ade0e1b9f9aed')

build() {
    arch-meson "$pkgname-$pkgver" build --buildtype=release
    meson compile -C build
}

check() {
    meson test -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build
}
