# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-cpp
pkgver=1.7.2
pkgrel=1
pkgdesc="C++ API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=('zenoh-c')
makedepends=('cmake' 'ninja')
source=("https://github.com/eclipse-zenoh/zenoh-cpp/archive/${pkgver}.tar.gz")
sha256sums=('0d41a2696527fabf6e401b9ffe5641d3861da99cd1180e7850069f15c1ebb24c')

options=(!debug)

build() {
  cmake -GNinja -B build -S "${pkgname}-${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DZENOHCXX_ZENOHC:BOOL=OFF \
           -DZENOHCXX_ZENOHPICO:BOOL=OFF \
           -DZENOHCXX_EXAMPLES_PROTOBUF:BOOL=OFF \
           -DZENOHCXX_ENABLE_TESTS:BOOL=OFF \
           -DZENOHCXX_ENABLE_EXAMPLES:BOOL=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
