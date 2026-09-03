# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu
pkgver=1.3.4
pkgrel=1
pkgdesc="An all-in-one Muslim app for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/sniper1720/khushu"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs' 'alsa-lib')
optdepends=('xdg-desktop-portal: autostart portal support')
options=(!debug)
makedepends=('cargo' 'gettext' 'meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sniper1720/khushu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d4149d86215b3957364b6a0d692af518db36aa0fbb4627458cbb7366e0dd97d')

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
