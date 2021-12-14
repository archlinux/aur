# Maintainer: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
set -u
pkgname='wasmedge'
pkgver=0.9.0
pkgrel='1'
pkgdesc='WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime for cloud native, edge, and decentralized applications. It powers serverless apps, embedded functions, microservices, smart contracts, and IoT devices.'
arch=('any')
url='https://wasmedge.org'
license=('Apache')
depends=('cmake' 'boost' 'openssl' 'pkgconf' 'ninja')
source=("https://github.com/WasmEdge/WasmEdge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('456b1463722e1a34e503d312263f2114430ab1b78dea7923d6e25e7ef7537cdc')

package() {
  set -u
  install -d "${pkgdir}/usr"
  cd "${srcdir}/WasmEdge-${pkgver}"
  cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release -DWASMEDGE_BUILD_TESTS=ON -DWASMEDGE_BUILD_AOT_RUNTIME=OFF -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  cmake --build build
  cd "${srcdir}/WasmEdge-${pkgver}/build"
  ninja install
  set +u
}
set +u
