# Maintainer: juanvel400 <me@juanvel400.com>
pkgname=xpt
pkgver=0.13.2
pkgrel=1
pkgdesc="a package-management suite for .xpt packages"
arch=('x86_64')
url="https://sr.ht/~juanvel400/xpt"
license=('BSD-3-Clause')
depends=(openssl libarchive zstd sqlite3)
makedepends=(pkg-config meson ninja)
source=("https://dl.juanvel400.com/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('f5eccb12539183021fb90b94ca55d3a6f6a604df16fa043e54333e6e176f156c')

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
