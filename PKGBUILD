# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=kdreports
pkgver=1.8.2
pkgrel=1
pkgdesc='A Qt library for generating printable and exportable reports from code and from XML descriptions'
arch=('x86_64')
url='https://www.kdab.com/development-resources/qt-tools/kd-reports'
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.12')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-${pkgver}/kdreports-${pkgver}.tar.gz")
sha512sums=('a5d4e9a88c583007ea02bd3c91680b7f44a41bee02a1b5d00f50ef2c41ec868f1c0fad16f7bb7338fe274d2d60e9f0a7ab3e2d0895f19a60306ee2d68c8d8805')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd build
  make test
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  cd ${pkgname}-${pkgver}
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -Dm644 LICENSE.US.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.US.txt
  install -Dm644 LICENSE.GPL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL.txt
  install -Dm644 LICENSE.LGPL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.LGPL.txt
}
