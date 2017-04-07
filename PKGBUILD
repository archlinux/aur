# Contributor: Figo.zhang <figo1802@gmail.com>

pkgname=cminpack
pkgver=1.3.6
pkgrel=1
pkgdesc="A C/C++ rewrite of the MINPACK software"
arch=('i686' 'x86_64')
url='http://devernay.free.fr/hacks/cminpack/cminpack.html'
license=('GPL' 'LGPL')
makedepends=('cmake')
source=("http://devernay.free.fr/hacks/cminpack/cminpack-${pkgver}.tar.gz")
md5sums=('2c7f81105f94ea9268617a1748cc3506')

build() {
  cd $srcdir/cminpack-${pkgver}
  mkdir -p build && pushd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMINPACK_LIB_INSTALL_DIR=lib \
    -DBUILD_SHARED_LIBS=ON -DBUILD_EXAMPLES=OFF ..
  make
}

package() {
  cd $srcdir/cminpack-${pkgver}/build
  make install DESTDIR="${pkgdir}"
}
