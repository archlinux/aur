# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu
pkgver=1.0.0
pkgrel=4
pkgdesc="An all-in-one Muslim app for Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/sniper1720/khushu"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs' 'geoclue2' 'alsa-lib' 'ttf-amiri')
optdepends=('xdg-desktop-portal: autostart portal support')
makedepends=('cargo' 'gettext' 'meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sniper1720/khushu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('82376b43f36b7da11be9afa476a127f060f036d773f98f71b1ee5712162dffc4')

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
