# Maintainer: Nicolas Cornu <ncornu@aldebaran.com>

pkgname=libqi
pkgver=2.1.3
pkgrel=1
pkgdesc="Qi library from Aldebaran"
arch=('i686' 'x86_64')
url="https://github.com/aldebaran/libqi"
license=('BSD3')
depends=('boost')
options=('strip' 'staticlibs')
makedepends=('qibuild')
source=("${url}/archive/v${pkgver}.tar.gz"
        "without_qiprobe.patch")

sha1sums=('778b4b82da7ca3c5522244e73fd901962a025271'
          'aedb17967843f9745d6ef9a2a2c183b669e94939')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p1 -i "$srcdir/without_qiprobe.patch"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p BUILD && cd BUILD
  cmake .. -DQI_WITH_TESTS=OFF -DQI_DIR=../sdk/cmake -DWITH_PROBES=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/BUILD
  make install DESTDIR=${pkgdir}
}
