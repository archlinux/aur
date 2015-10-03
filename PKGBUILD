# $Id$
# Maintainer: CyrIng <labs[at]cyring[dot]fr>
# Contributor: CyrIng <labs[at]cyring[dot]fr>
pkgname=geogebra-installer
pkgver=5.0.156.0
pkgrel=1
pkgdesc="Dynamic mathematics software with interactive graphics, algebra and spreadsheet"
arch=('any')
url='http://www.geogebra.org/'
license=('GPL3' 'CCPL:by-sa' 'CCPL:by-nc')
depends=('desktop-file-utils' 'gsl' 'hicolor-icon-theme' 'java-runtime'
         'shared-mime-info' 'xdg-utils')
makedepends=('gendesk')
conflicts=('geogebra')
source=("http://download.geogebra.org/installers/5.0/GeoGebra-Linux-Portable-${pkgver}.tar.bz2"
        "http://static.geogebra.org/images/geogebra-logo.svg"
        "geogebra")
install=geogebra.install
changelog=ChangeLog

prepare() {
  gendesk -f -n --pkgname "geogebra" --pkgdesc "${pkgdesc}" \
          --name="GeoGebra" \
          --categories="Education;Science;Math" \
          --mimetypes="application/vnd.geogebra.file;application/vnd.geogebra.tool"
}

package() {
  cd "GeoGebra-Linux-Portable-${pkgver}"

  install -Dm755 "${srcdir}/geogebra" "${pkgdir}/usr/bin/geogebra"
  install -dm755 "${pkgdir}/usr/share/geogebra"
  install "geogebra/"* -t "${pkgdir}/usr/share/geogebra/"

  install -Dm644 "${srcdir}/geogebra.desktop" "${pkgdir}/usr/share/applications/geogebra.desktop"
  install -Dm644 "${srcdir}/geogebra-logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/geogebra.svg"
}

md5sums=('SKIP'
         'SKIP'
         'SKIP')
