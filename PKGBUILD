# Maintainer: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
# Maintainer: tee < teeaur at duck dot com >
pkgname=wasmedge
pkgver=0.15.0
pkgrel=1
pkgdesc='WasmEdge is a lightweight, high-performance, and extensible WebAssembly runtime for cloud native, edge, and decentralized applications. It powers serverless apps, embedded functions, microservices, smart contracts, and IoT devices.'
arch=('any')
url='https://wasmedge.org'
license=('Apache-2.0')
depends=('cmake' 'boost' 'openssl' 'pkgconf' 'ninja' 'rapidjson')
#source=("https://github.com/WasmEdge/WasmEdge/archive/${pkgver}.tar.gz")
source=("https://github.com/WasmEdge/WasmEdge/releases/download/$pkgver/WasmEdge-$pkgver-src.tar.gz")
sha256sums=('17915c4d047bc7a02aca862f4852101ec8d35baab7b659593687ab8c84b00938')

package() {
  install -d "${pkgdir}/usr"
  cd "${srcdir}/wasmedge"
  cmake -Bbuild -GNinja -DCMAKE_BUILD_TYPE=Release -DWASMEDGE_BUILD_TESTS=ON \
    -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  cmake --build build
  cd build
  ninja install
}
