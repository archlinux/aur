# Maintainer: Mikkel Kroman <mk@uplink.io>

pkgname=cnmem
pkgver=1.0.0
pkgrel=1
pkgdesc='A simple memory manager for CUDA designed to help Deep Learning frameworks manage memory'
arch=('any')
url='https://github.com/NVIDIA/cnmem'
license=('BSD')
depends=('cuda')
makedepends=('cuda' 'cmake')
options=('!emptydirs')
source=("https://github.com/NVIDIA/cnmem/archive/v${pkgver}.tar.gz")
sha256sums=('bd8c2803813f00c55995b106a5d385a343211100f8943856525472997f5b2bb0')

build() {
  cd "cnmem-${pkgver}"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" ..
  make
}

package() {
  cd "${srcdir}/cnmem-${pkgver}/build"
  make install
  install -Dm644 "${srcdir}/cnmem-${pkgver}/include/cnmem.h" "${pkgdir}/usr/include/cnmem.h"
  install -Dm644 "${srcdir}/cnmem-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
