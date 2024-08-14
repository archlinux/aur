pkgname=mingw-w64-nlohmann-json
pkgver=3.11.3
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++ (mingw-w64)'
url='https://github.com/nlohmann/json'
license=(MIT)
arch=(any)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/nlohmann/json/archive/v${pkgver}.tar.gz")
sha256sums=('0d8ef5af7f9794e3263480193c491549b2ba6cc74bb018906202ada498a79406')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/json-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=ON -B build-${_arch} .
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/json-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  done
}
