# Maintainer: juanvel400 <me@juanvel400.com>
pkgname=xpt
pkgver=0.14.0
pkgrel=1
pkgdesc="a package-management suite for .xpt packages"
arch=('x86_64')
url="https://sr.ht/~juanvel400/xpt"
license=('BSD-3-Clause')
depends=(openssl libarchive zstd sqlite3)
makedepends=(pkg-config meson ninja)
source=("https://dl.juanvel400.com/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('1ebfc087f90180426dcc2dc5e7dc6909167edf059411e697d7ede42744302b4f')

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
