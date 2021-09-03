# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.15.0
pkgrel=2
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=6.15.0' 'cuda>=8.0')
optdepends=('monero: wallet')
makedepends=('cmake' 'openssl' 'cuda>=8.0')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('64c440a4cb439f3cc8120f1883274158f95df988ab91eccb1d2d2abf0bedbbfe')

build() {
  cd "${pkgname}-${pkgver}"

  cmake -DCMAKE_C_COMPILER=/opt/cuda/bin/gcc -DCMAKE_CXX_COMPILER=/opt/cuda/bin/g++ -S . -B build
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
