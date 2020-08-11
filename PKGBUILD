# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>

pkgname=xmrig-cuda
pkgver=6.3.0
pkgrel=2
pkgdesc='NVIDIA CUDA plugin for XMRig miner.'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-cuda'
depends=('xmrig>=5.11.0' 'cuda>=11.0.0-1')
optdepends=('monero: wallet')
# We unfortunately need to be hard on which version of CUDA we use
makedepends=('cmake' 'openssl' 'cuda>=11.0.0-1')
license=('GPL')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('80cb04afc1f32aff1cb0693eed30e96c64fdc3510a8fe189237d5f098da101cd')

prepare() {
  cd "${pkgname}-${pkgver}"

  # create build dir
  [ -d build ] || mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"

  # CUDA on ArchLinux uses GCC 9.0
  cmake -DCMAKE_C_COMPILER=/usr/bin/gcc-9 -DCMAKE_CXX_COMPILER=/usr/bin/g++-9 ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "build/libxmrig-cuda.so" "${pkgdir}/usr/lib/libxmrig-cuda.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
