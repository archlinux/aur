# Maintainer: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
set -u
pkgname='wasmedge'
pkgver=0.10.0
pkgrel='1'
pkgdesc='WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime for cloud native, edge, and decentralized applications. It powers serverless apps, embedded functions, microservices, smart contracts, and IoT devices.'
arch=('any')
url='https://wasmedge.org'
license=('Apache')
depends=('cmake' 'boost' 'openssl' 'pkgconf' 'ninja')
source=("https://github.com/WasmEdge/WasmEdge/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('113614336f1208c92ca658b3d44cc821cdd2d3e535f98d84e654e8a20c531c2e')

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
