# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

pkgname=libemf2svg
pkgver=1.8.2
pkgrel=1
pkgdesc="EMF (Microsoft Enhanced Metafile) to SVG conversion library"
arch=(x86_64)
url="https://github.com/claricle/libemf2svg"
license=(GPL-2.0-or-later)
depends=(libpng libiconv fontconfig freetype2)
makedepends=(cmake git)
provides=("$pkgname.so=$pkgver")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('96e287c9717790ff36485a9dc61da6d6e936bff101411c983e7159e023a451d5848fa91d0efb6770e117ee86031069cbb7382a21bc00b4eededbe8cdbd2d4604')

build() {
    local cmake_options=(
        -B build
        -S "$pkgname-$pkgver"
        -Wno-author
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr
        -DUSE_SYSTEM_LIBUEMF=OFF
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
