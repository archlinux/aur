pkgname=mingw-w64-fast_float
pkgver=8.1.0
pkgrel=1
arch=(any)
url="https://github.com/fastfloat/fast_float/"
license=('MIT' 'Apache-2.0')
pkgdesc='Fast and exact implementation of the C++ from_chars functions:4x faster than strtod (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/fastfloat/fast_float/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4bfabb5979716995090ce68dce83f88f99629bc17ae280eae79311c5340143e1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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
