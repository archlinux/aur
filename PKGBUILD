# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=dmalloc
pkgver=5.6.5
pkgrel=1
pkgdesc='Debug Malloc memory allocation debugging C library'
license=('ISC')
url='https://github.com/j256/dmalloc'
arch=('x86_64')
depends=()
makedepends=('git' 'make')
source=(
  "https://github.com/j256/dmalloc/releases/download/dmalloc_release_${pkgver//./_}/dmalloc-${pkgver}.tgz"
  0001-fix-DESTDIR.patch
)
sha256sums=('480e3414ab6cedca837721c756b7d64b01a84d2d0e837378d98444e2f63a7c01'
            '9791b34e6999540cd823bfb045772a6ef0a59cdb354bc18353d768dbe7d21335')

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
