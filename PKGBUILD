# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=kdreports
pkgver=2.0.0
pkgrel=1
pkgdesc='A Qt library for generating printable and exportable reports from code and from XML descriptions'
arch=('x86_64')
url='https://www.kdab.com/development-resources/qt-tools/kd-reports'
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.12')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-${pkgver}/kdreports-${pkgver}.tar.gz")
sha512sums=('80ab3a9fdd490a998b0f200fd1f7a218517b39e1ff2fceb70c5badce74a59e6957becd976233083628739fd8d984aced3733e1f12b1ad39f9cf24a0f9c36ee78')

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
