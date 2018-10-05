pkgname=mingw-w64-pegtl
pkgver=2.7.1
pkgrel=1
pkgdesc="Parsing Expression Grammar Template Library (mingw-w64)"
license=('MIT')
arch=('any')
url="https://github.com/taocpp/PEGTL"
depends=()
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/taocpp/PEGTL/archive/${pkgver}.tar.gz")
sha256sums=('af68ee953d4efc48e090722f8cb9ad4ef1140f6a5443581563e003e060376718')

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

