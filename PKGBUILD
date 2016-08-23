# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=kdreports
pkgver=1.7.1
pkgrel=1
pkgdesc="A Qt library for creating printable reports"
arch=('i686' 'x86_64')
url="http://www.kdab.com/kd-reports/"
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.11')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-${pkgver}/kdreports-${pkgver}.tar.gz")
sha512sums=('b06b1e58ad9cb4181b0b8b9c7e161a5eb8be4e44930964e4becfbb84b7be901bcfa4d0bc7959209c840be5374cbf09703bea581b6691a542125827caf1062ef7')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DKDReports_TESTS=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 LICENSE.US.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.US.txt
  install -Dm644 LICENSE.GPL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL.txt
  install -Dm644 LICENSE.LGPL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LGPL.txt
}
