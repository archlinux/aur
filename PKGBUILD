# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>
# Contributor: Piotr Krzemiński <pio.krzeminski@gmail.com>

pkgname=qnapi
pkgver=0.1.9
pkgrel=2
pkgdesc="Qt5 client for downloading movie subtitles from NapiProjekt, OpenSubtitles, Napisy24"
arch=('i686' 'x86_64')
url="https://github.com/QNapi/${pkgname}"
license=('GPL')
depends=('qt5-base' 'ffmpeg')
changelog=ChangeLog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/QNapi/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ea1d5056e2bfbe9a2feea928388bd411bac64b9b19327c73946c7d4dd0c9ec9b')

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
  mkdir -p ${pkgdir}/usr/share/kservices5/ServiceMenus/
  cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/qnapi-scan.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/qnapi-scan.desktop
  cp ${pkgdir}/usr/share/kde4/services/ServiceMenus/qnapi-download.desktop ${pkgdir}/usr/share/kservices5/ServiceMenus/qnapi-download.desktop
}
