# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=beagle-lib-svn

pkgver=1261
pkgrel=1
pkgdesc="general purpose library for evaluating the likelihood of sequence evolution on trees"
arch=('i686' 'x86_64')
url="https://code.google.com/p/beagle-lib/"
license=('GPL3')
depends=('libtool')
optdepends=('cuda-toolkit' 'java-environment' 'libcl')
makedepends=('svn')
conflicts=('beagle-lib')
provides=('beagle-lib')

source=("$pkgname-trunk::svn+http://beagle-lib.googlecode.com/svn/trunk")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname-trunk

  svnversion | tr -d [A-z]
}

prepare() {
  cd $srcdir/$pkgname-trunk

  ./autogen.sh
}

build() {
  cd $srcdir/$pkgname-trunk

  ./configure \
    --prefix=/usr \
    --enable-openmp

  make
}

package() {
  cd $srcdir/$pkgname-trunk

  make DESTDIR=$pkgdir install
}
