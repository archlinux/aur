pkgname=('mingw-w64-nanoflann')
pkgver=1.8.0
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees (mingw-w64)'
url='https://github.com/jlblancoc/nanoflann'
arch=('any')
license=('BSD')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-eigen')
source=("https://github.com/jlblancoc/nanoflann/archive/v${pkgver}.tar.gz")
sha256sums=('14e82a1de64a8b26486322d36817449a8bc2e63ea3b91bfee64f320155790a9c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd nanoflann-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DNANOFLANN_BUILD_EXAMPLES=OFF -DNANOFLANN_BUILD_TESTS=OFF -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nanoflann-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
  done
}
