# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=cloog
pkgver=0.18.1
pkgrel=4
pkgdesc="Library that generates loops for scanning polyhedra"
arch=('i686' 'x86_64')
url="http://www.bastoul.net/cloog/"
license=('GPL')
depends=('isl')
source=(http://www.bastoul.net/cloog/pages/download/$pkgname-$pkgver.tar.gz
        cloog-0.18.1-isl-compat.patch)
md5sums=('e34fca0540d840e5d0f6427e98c92252'
         '976c999b44c6e364455a670d12523242')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # combination of upstream commits b561f860, 2d8b7c6b and 22643c94
  patch -p1 -i $srcdir/cloog-0.18.1-isl-compat.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --with-isl=system
  make
}

# https://github.com/periscop/cloog/issues/25
# check() {
#   cd $srcdir/$pkgname-$pkgver
#   make check
# }

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir/ install
}
