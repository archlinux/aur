pkgname=coin-or-lemon
pkgver=1.3.1
pkgrel=1
pkgdesc="A C++ template library providing many common graph algorithms"
arch=('i686' 'x86_64')
url="http://lemon.cs.elte.hu/trac/lemon"
license=('BSD')
groups=('coin-or')
depends=('coin-or-cbc' 'coin-or-clp' 'glpk')
makedepends=('cmake')
source=("http://lemon.cs.elte.hu/pub/sources/lemon-${pkgver}.tar.gz")
sha1sums=('b23d64c21b4b9088ad51e85316964a4a4138f82a')

build() {
  cd "$srcdir/lemon-$pkgver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLEMON_ENABLE_GLPK=YES -DLEMON_ENABLE_ILOG=NO -DLEMON_ENABLE_COIN=YES \
    -DLEMON_ENABLE_SOPLEX=no -DGHOSTSCRIPT_EXECUTABLE= \
    -DDOXYGEN_EXECUTABLE= -DPYTHON_EXECUTABLE= .. 
  make
}

package() {
  cd "$srcdir/lemon-$pkgver/build"
  make DESTDIR="$pkgdir/" install
}

