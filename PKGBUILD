# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=zenoh-cpp
pkgver=1.8.0
pkgrel=1
pkgdesc="C++ API for Zenoh"
arch=('any')
url="https://zenoh.io/"
license=('Apache-2.0')
depends=('zenoh-c')
makedepends=('cmake' 'ninja')
source=("https://github.com/eclipse-zenoh/zenoh-cpp/archive/${pkgver}.tar.gz")
sha256sums=('19f6d29af3711561c4b9caffe64ef0a67602594e2e2f6615b43b9db7133d8313')

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
