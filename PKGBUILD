pkgname=mingw-w64-fast_float
pkgver=8.2.10
pkgrel=1
arch=(any)
url="https://github.com/fastfloat/fast_float/"
license=('MIT' 'Apache-2.0')
pkgdesc='Fast and exact implementation of the C++ from_chars functions:4x faster than strtod (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/fastfloat/fast_float/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76f958dd97b1cf4d8862d1f0986a47d4bdfa8845252bae15ef0f40de3b95961f')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd fast_float-$pkgver
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fast_float-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
  done 
}
