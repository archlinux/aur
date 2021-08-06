pkgname=mingw-w64-laz-perf
pkgver=2.0.5
pkgrel=1
pkgdesc='Alternative LAZ implementation for C++ and JavaScript (mingw-w64)'
arch=('any')
url='https://github.com/hobu/laz-perf'
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/hobu/laz-perf/archive/${pkgver}.tar.gz")
sha512sums=('fd4f53399c01c168b977b1da101ba93ade4a2020aa76cf58f5af64a47a315bc443a71985404d62541670fef24a47357d40d21a08b4e7bbd70b562182f4bb92a1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/laz-perf-${pkgver}"
}

build() {
  cd "${srcdir}/laz-perf-${pkgver}"
    for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/laz-perf-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
