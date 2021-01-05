# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=dmalloc
pkgver=5.6.5
pkgrel=2
pkgdesc='Debug Malloc memory allocation debugging C library'
license=('ISC')
url='https://github.com/j256/dmalloc'
arch=('x86_64')
depends=()
makedepends=('make')
source=(
  "https://github.com/j256/dmalloc/releases/download/dmalloc_release_${pkgver//./_}/dmalloc-${pkgver}.tgz"
  0001-fix-DESTDIR.patch
)
sha256sums=('480e3414ab6cedca837721c756b7d64b01a84d2d0e837378d98444e2f63a7c01'
            '9a3036e4d5fb9cd78576e8167f81af61da2b3276929152e12d08a2e525ae1b7f')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ${srcdir}/0001-fix-DESTDIR.patch
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}
package() {
	cd "${srcdir}/$pkgname-$pkgver"

    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
