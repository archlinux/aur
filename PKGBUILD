# Maintainer: Vincent von Schelm <aur at vncnt dot eu>

pkgname=('htd')
pkgName=('htd')
pkgver=1.2
pkgrel=2
pkgdesc="A small but efficient C++ library for computing (customized) tree and hypertree decompositions."
arch=('x86_64')
url="https://github.com/mabseher/htd/"
license=('GPL3')
groups=('viennarna-package')
depends=('gcc-libs')
makedepends=('cmake'
             'doxygen')
provides=("libhtd.so=$pkgver" "htd_main=$pkgver")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mabseher/htd/archive/${pkgver}.tar.gz")
md5sums=('b96a0a6ff95b1321b3fbaf5261d82619')
sha1sums=('042074e7c14dbeb6448beb8a27858b7a91257d01')
sha256sums=('072a67d0853316626012961d2fcf2a112c4df75369b02a88f9d8757a868ccba4')

prepare() {
	cd "$pkgName-$pkgver"
}

build() {
	cd "$pkgName-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
	make doc
}

check() {
	cd "$pkgName-$pkgver"
	make test
}

package() {
	cd "$pkgName-$pkgver"
	make DESTDIR="$pkgdir" install

	rm $pkgdir/usr/lib/libgmock_main.so
	rm $pkgdir/usr/lib/libgtest_main.so
  rm $pkgdir/usr/lib/libgtest.so
  rm $pkgdir/usr/lib/libgmock.so
  rm -r $pkgdir/usr/include/gtest
  rm -r $pkgdir/usr/include/gmock

}
