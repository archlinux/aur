
pkgname=mingw-w64-sparsehash
pkgver=2.0.3
pkgrel=1
pkgdesc="Library that contains several hash-map implementations, including implementations that optimize for space or speed. (mingw-w64)"
arch=("any")
url="https://github.com/sparsehash/sparsehash"
license=('BSD')
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("https://github.com/sparsehash/sparsehash/archive/sparsehash-$pkgver.tar.gz")
sha256sums=('05e986a5c7327796dad742182b2d10805a8d4f511ad090da0490f146c1ff7a8c')

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
