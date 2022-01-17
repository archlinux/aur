# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=kdreports
pkgver=2.1.0
pkgrel=1
pkgdesc='A Qt library for generating printable and exportable reports from code and from XML descriptions'
arch=('x86_64')
url='https://www.kdab.com/development-resources/qt-tools/kd-reports'
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.12')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-${pkgver}/kdreports-${pkgver}.tar.gz")
sha512sums=('c35f9cb22785d758f6e505c61d3c2f78db8ab99b2292c561d43e2934126a8127702df8b4e5b6b7fd6630fe30660a342481f325481485405ea5c4e195a20f4f1b')

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
  install -Dm644 LICENSES/*.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
