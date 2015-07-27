# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=qnapi
pkgver=0.1.7
pkgrel=1
pkgdesc="Qt5 client for downloading movie subtitles from NAPI Project"
arch=('i686' 'x86_64')
url="https://github.com/QNapi/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QNapi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0a14c7e0e1d7c1cf5e03b17e00f00b6133e6fc12ac80c4d3f302cd5e9d7cdd1e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}/" install
  mkdir -p ${pkgdir}/usr/share/kde4/services/ServiceMenus/
  mv ${pkgdir}/usr/share/doc/qnapi/qnapi-scan.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/qnapi-scan.desktop 
  mv ${pkgdir}/usr/share/doc/qnapi/qnapi-download.desktop ${pkgdir}/usr/share/kde4/services/ServiceMenus/qnapi-download.desktop
  mkdir -p ${pkgdir}/usr/share/kservices5/services/ServiceMenus/
  cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/qnapi-scan.desktop ${pkgdir}/usr/share/kservices5/services/ServiceMenus/qnapi-scan.desktop
  cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/qnapi-download.desktop ${pkgdir}/usr/share/kservices5/services/ServiceMenus/qnapi-download.desktop
}
