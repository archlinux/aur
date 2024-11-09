pkgname=mingw-w64-sparsehash
pkgver=2.0.4
pkgrel=1
pkgdesc="Library that contains several hash-map implementations, including implementations that optimize for space or speed. (mingw-w64)"
arch=("any")
url="https://github.com/sparsehash/sparsehash"
license=('BSD')
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("https://github.com/sparsehash/sparsehash/archive/sparsehash-$pkgver.tar.gz")
sha256sums=('8cd1a95827dfd8270927894eb77f62b4087735cbede953884647f16c521c7e58')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir"/sparsehash-sparsehash-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/sparsehash-sparsehash-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir" install
  done
}
