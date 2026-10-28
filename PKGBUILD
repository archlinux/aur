# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-cpp
pkgver=1.10.2
pkgrel=1
pkgdesc="C++ API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=('zenoh-c')
makedepends=('cmake' 'ninja')
source=("https://github.com/eclipse-zenoh/zenoh-cpp/archive/${pkgver}.tar.gz")
sha256sums=('db7e3993cd398391adb254bfcb91ce8909157f52b6fb2d7eb47ce4e9710273a6')

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
