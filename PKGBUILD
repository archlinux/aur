pkgname=mingw-w64-utf8cpp
pkgver=3.2.3
pkgrel=1
pkgdesc="UTF-8 with C++ in a Portable Way (mingw-w64)"
url="https://github.com/nemtrif/utfcpp"
arch=('any')
license=('Custom')
depends=()
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/nemtrif/utfcpp/archive/v${pkgver}.tar.gz")
sha256sums=('3ba9b0dbbff08767bdffe8f03b10e596ca351228862722e4c9d4d126d2865250')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "utfcpp-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DUTF8_TESTS=OFF -DUTF8_SAMPLES=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/utfcpp-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
