# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=qnapi
pkgver=0.1.8
pkgrel=1
pkgdesc="Qt5 client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24"
arch=('i686' 'x86_64')
url="https://github.com/QNapi/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QNapi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('83b4d54addc189df965a6a429918cadb904a201e3b250c26ad1cb97c56554b1a')

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
