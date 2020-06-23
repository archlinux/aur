# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.2.1
pkgrel=1
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=5.11.0' 'cuda>=10.2.89-5')
optdepends=('monero: wallet')
# We unfortunately need to be hard on which version of CUDA we use
makedepends=('cmake' 'openssl' 'cuda>=10.2.89-5')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fc44a5dcf60ee33b2e4fe3abdffcb669b93b86bd3eef80f86e60885dba14610e')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"

  # CUDA on ArchLinux uses GCC 8.0
  cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-8 -DCMAKE_CXX_COMPILER=/usr/bin/g++-8 ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
