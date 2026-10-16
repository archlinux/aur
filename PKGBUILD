# Maintainer: juanvel400 <me@juanvel400.com>
pkgname=xpt
pkgver=0.12.0
pkgrel=1
pkgdesc="a package-management suite for .xpt packages"
arch=('x86_64')
url="https://sr.ht/~juanvel400/xpt"
license=('BSD-3-Clause')
depends=(openssl libarchive zstd sqlite3)
makedepends=(pkg-config meson ninja)
source=("https://dl.juanvel400.com/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('9d9a2faa9f49acb91b09218f0e24574d0017917bdb32d3ac92ef93211e575476')

build() {
    cd "$pkgname-$pkgver"
    meson setup build --prefix=/usr --sysconfdir=/etc --localstatedir=/var --buildtype=release -Ddoxygen=disabled
    meson compile -C build
}

check() {
    cd "$pkgname-$pkgver"
    meson test -C build
}

package() {
    cd "$pkgname-$pkgver"
    meson install -C build --destdir="$pkgdir/"
}
