pkgname=('mingw-w64-nanoflann')
pkgver=1.5.0
pkgrel=1
pkgdesc='a C++ header-only library for Nearest Neighbor (NN) search wih KD-trees (mingw-w64)'
url='https://github.com/jlblancoc/nanoflann'
arch=('any')
license=('BSD')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-eigen')
source=("https://github.com/jlblancoc/nanoflann/archive/v${pkgver}.tar.gz")
sha256sums=('89aecfef1a956ccba7e40f24561846d064f309bc547cc184af7f4426e42f8e65')

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
