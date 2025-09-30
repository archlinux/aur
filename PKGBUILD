pkgname=mingw-w64-eigen
pkgver=5.0.0
pkgrel=1
pkgdesc="Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra. (mingw-w64)"
arch=('any')
url='http://eigen.tuxfamily.org'
license=('MPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://gitlab.com/libeigen/eigen/-/archive/${pkgver}/eigen-${pkgver}.tar.bz2")
sha256sums=('bdca0ec740fb83be21fe038699923f4c589ead9ab904f4058a9c97752e60d50b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/eigen-${pkgver}
}

build() {
  cd "$srcdir"/eigen-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/eigen-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
  done
}

