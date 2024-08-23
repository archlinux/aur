pkgname=('mingw-w64-nanoflann')
pkgver=1.6.0
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees (mingw-w64)'
url='https://github.com/jlblancoc/nanoflann'
arch=('any')
license=('BSD')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-eigen')
source=("https://github.com/jlblancoc/nanoflann/archive/v${pkgver}.tar.gz")
sha256sums=('f889026fbcb241e1e9d71bab5dfb9cc35775bf18a6466a283e2cbcd60edb2705')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd nanoflann-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DNANOFLANN_BUILD_EXAMPLES=OFF -DNANOFLANN_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nanoflann-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
