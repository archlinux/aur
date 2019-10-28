pkgname=mingw-w64-pegtl
pkgver=2.8.1
pkgrel=1
pkgdesc="Parsing Expression Grammar Template Library (mingw-w64)"
license=('MIT')
arch=('any')
url="https://github.com/taocpp/PEGTL"
depends=()
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/taocpp/PEGTL/archive/${pkgver}.tar.gz")
sha256sums=('d23f81a60896cdd8c2ce0d1b31737fe0e1137915ba3fdb4f366ae1a997a1bce6')

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

