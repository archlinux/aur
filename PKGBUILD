pkgname=('mingw-w64-nanoflann')
pkgver=1.6.2
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees (mingw-w64)'
url='https://github.com/jlblancoc/nanoflann'
arch=('any')
license=('BSD')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-eigen')
source=("https://github.com/jlblancoc/nanoflann/archive/v${pkgver}.tar.gz")
sha256sums=('c1b8f2e4d32c040249dad14a89dd03c5106a8c56f3e9ca4e60a0836a59259c0c')

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
