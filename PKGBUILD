# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=kdreports
pkgver=1.9.0
pkgrel=1
pkgdesc='A Qt library for generating printable and exportable reports from code and from XML descriptions'
arch=('x86_64')
url='https://www.kdab.com/development-resources/qt-tools/kd-reports'
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.12')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-${pkgver}/kdreports-${pkgver}.tar.gz")
sha512sums=('48c0fadf0e0e86a915f13c98ec698c4c5540137e7412b748f306ebd2dd3bfeaba3deb077816fbedad75d7753c69beec40550f9b1d966a6d41ea8cc42593e75a1')

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
