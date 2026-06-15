pkgname=('mingw-w64-nanoflann')
pkgver=1.10.1
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees (mingw-w64)'
url='https://github.com/jlblancoc/nanoflann'
arch=('any')
license=('BSD')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-eigen')
source=("https://github.com/jlblancoc/nanoflann/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9ce16ab66c9d61a529c704a913dc41947a47e29928482105cd39f3436cdb92a1')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd nanoflann-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DNANOFLANN_BUILD_EXAMPLES=OFF -DNANOFLANN_BUILD_TESTS=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/nanoflann-$pkgver"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}
