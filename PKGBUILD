# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
pkgname=${_pkgname,,}
pkgver=0.5.0
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=('i686' 'x86_64')
url="https://bourgeoislab.wordpress.com/gpxlab/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('430672eaf0c76e1f7f43cf2c117e63d818ac7e444acceefe6a0ef5a2f7b3d7f4')

build() {
  cd ${_pkgname}-${pkgver}

  lrelease GPXLab/GPXLab.pro
  qmake GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages
  install -d 755 ${pkgdir}/usr/share/${pkgname}/translations

  install -m 755 bin/GPXLab ${pkgdir}/usr/bin/${pkgname}
  install -m 644 GPXLab/locale/*.qm ${pkgdir}/usr/share/${pkgname}/translations
  install -m 644 doc/gpxlab.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -m 644 pkg/gpxlab.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 644 pkg/gpxlab.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
