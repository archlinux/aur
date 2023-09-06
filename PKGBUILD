# Maintainer: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
# Maintainer: tee < teeaur at duck dot com >
pkgname='wasmedge'
pkgver=0.13.4
pkgrel=1
pkgdesc='WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime for cloud native, edge, and decentralized applications. It powers serverless apps, embedded functions, microservices, smart contracts, and IoT devices.'
arch=('any')
url='https://wasmedge.org'
license=('Apache')
depends=('cmake' 'boost' 'openssl' 'pkgconf' 'ninja' 'rapidjson')
source=("https://github.com/WasmEdge/WasmEdge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3771fb4b85cd1cb51896f7b691a0ecb784517b64caa13f624a1383818f678237')

package() {
  install -d "${pkgdir}/usr"
  cd "${srcdir}/WasmEdge-${pkgver}"
  cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release -DWASMEDGE_BUILD_TESTS=ON \
    -DWASMEDGE_BUILD_AOT_RUNTIME=OFF -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  cmake --build build
  cd "${srcdir}/WasmEdge-${pkgver}/build"
  ninja install
}
