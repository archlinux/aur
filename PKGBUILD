# Contributor: Raffaele Zamorano
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=tumic0
_pkgname=gpxsee
pkgname=${_pkgname}
pkgver=5.7
pkgrel=1
pkgdesc='GPS log file viewer and analyzer'
arch=('i686' 'x86_64')
url="http://www.gpxsee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
optdepends=('qt5-imageformats: Support for TIFF')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1e1f33e597fd33772dbe4b3a8b90697e1dd7bb254a8161e2ad977467624c9d2f')

build() {
  cd GPXSee-${pkgver}

  lrelease-qt5 gpxsee.pro
  qmake gpxsee.pro
  make
}

package() {
  cd GPXSee-${pkgver}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages
  install -d 755 ${pkgdir}/usr/share/${pkgname}
  install -d 755 ${pkgdir}/usr/share/${pkgname}/maps
  install -d 755 ${pkgdir}/usr/share/${pkgname}/csv
  install -d 755 ${pkgdir}/usr/share/${pkgname}/translations

  install -m 755 GPXSee ${pkgdir}/usr/bin/${pkgname}
  install -m 644 pkg/maps/* ${pkgdir}/usr/share/${pkgname}/maps
  install -m 644 pkg/csv/* ${pkgdir}/usr/share/${pkgname}/csv
  install -m 644 lang/*.qm ${pkgdir}/usr/share/${pkgname}/translations
  install -m 644 icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -m 644 pkg/gpxsee.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 644 pkg/gpxsee.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
