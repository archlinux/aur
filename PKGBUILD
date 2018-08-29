# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

pkgname=kdreports
pkgver=1.8.0
pkgrel=1
pkgdesc='A Qt library for generating printable and exportable reports from code and from XML descriptions'
arch=('x86_64')
url='https://www.kdab.com/development-resources/qt-tools/kd-reports'
license=('GPL' 'LGPL' 'custom')
depends=('qt5-base')
makedepends=('cmake>=2.8.12')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KDAB/KDReports/releases/download/kdreports-${pkgver}/kdreports-${pkgver}.tar.gz")
sha512sums=('55514cd6107ac319b1f52d32d1b9780e00382fc89698f4a9ffa6e93c92cb9c2f5bc6df6a95fa7bbad53a332f3c7e86b738a50e68047afb40d05d4ba1b385ca02')

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
