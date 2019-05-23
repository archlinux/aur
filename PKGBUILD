pkgname=mingw-w64-pegtl
pkgver=2.8.0
pkgrel=1
pkgdesc="Parsing Expression Grammar Template Library (mingw-w64)"
license=('MIT')
arch=('any')
url="https://github.com/taocpp/PEGTL"
depends=()
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/taocpp/PEGTL/archive/${pkgver}.tar.gz")
sha256sums=('655197f9ff543fb6319cec9b86bb34147dd54c42dde78b89ff93d15c762d5f73')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd PEGTL-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DPEGTL_BUILD_EXAMPLES=OFF \
      -DPEGTL_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/PEGTL-${pkgver}/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
  done
}

