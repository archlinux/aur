# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine
pkgver=0.4.0
pkgrel=2
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'gperftools' 'boost-libs')
makedepends=('cmake' 'boost')
replaces=('csympy-git')
conflicts=('csympy-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/sympy/symengine/archive/v$pkgver.tar.gz)
sha256sums=('dd755901a9e2a49e53ba3bbe3f565f94265af05299e57a7b592186dd35916a1b')

build() {
  cd $pkgname-$pkgver

  mkdir -p build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DWITH_TCMALLOC:BOOL=ON \
    -DWITH_PTHREAD:BOOL=ON \
    -DWITH_SYMENGINE_THREAD_SAFE:BOOL=ON \
    -DWITH_ARB:BOOL=OFF \
    -DWITH_BOOST:BOOL=ON
  make
}

check() {
  cd $pkgname-$pkgver/build
  make test
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
