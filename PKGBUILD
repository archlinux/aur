# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=symengine
pkgver=0.5.0
pkgrel=1
pkgdesc="Fast symbolic manipulation library, written in C++"
url="http://sympy.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gmp' 'gperftools' 'boost-libs')
makedepends=('cmake' 'boost')
replaces=('csympy-git')
conflicts=('csympy-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/sympy/symengine/archive/v$pkgver.tar.gz)
sha256sums=('5d02002f00d16a0928d1056e6ecb8f34fd59f3bfd8ed0009a55700334dbae29b')

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
