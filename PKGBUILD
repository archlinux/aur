# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=cloog
pkgver=0.18.3
pkgrel=3
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('isl>=0.14')
source=(http://www.bastoul.net/cloog/pages/download/$pkgname-$pkgver.tar.gz)
md5sums=('3ded42bb87022981abccd42466a00b65')

prepare() {
  cd $srcdir/$pkgname-$pkgver
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-isl=system

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  # There are certain race conditions on running the tests, so we restrict
  # it to one job (one CPU core).
  make -j1 check
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
