pkgname=mingw-w64-fast_float
pkgver=4.0.0
pkgrel=1
arch=(any)
url="https://github.com/fastfloat/fast_float/"
license=('MIT' 'Apache-2.0')
pkgdesc='Fast and exact implementation of the C++ from_chars functions:4x faster than strtod (mingw-w64)'
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/fastfloat/fast_float/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9470f229b9ea8d116af7c92f2ab8e8ae6b3c3225d15081b859634328f28d4664')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd fast_float-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fast_float-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
  done 
}
