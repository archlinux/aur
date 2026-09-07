# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-cpp
pkgver=1.10.1
pkgrel=1
pkgdesc="C++ API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=('zenoh-c')
makedepends=('cmake' 'ninja')
source=("https://github.com/eclipse-zenoh/zenoh-cpp/archive/${pkgver}.tar.gz")
sha256sums=('64d3c315c4fdfa54b4d96ee27ee2b3d98320b0fb289402fff9d7a99bc513528e')

_builddir="build-${pkgver}"

options=(!debug)

build() {
  CFLAGS+=' -fno-lto'
  CXXFLAGS+=' -fno-lto'
  cmake -GNinja -B "${_builddir}" -S "${pkgname}-${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DZENOHCXX_ZENOHC:BOOL=OFF \
           -DZENOHCXX_ZENOHPICO:BOOL=OFF \
           -DZENOHCXX_EXAMPLES_PROTOBUF:BOOL=OFF \
           -DZENOHCXX_ENABLE_TESTS:BOOL=OFF \
           -DZENOHCXX_ENABLE_EXAMPLES:BOOL=OFF
  cmake --build "${_builddir}"
}

package() {
  DESTDIR="$pkgdir" cmake --install "${_builddir}"
}
