# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
pkgname=${_pkgname,,}
pkgver=0.5.0
pkgrel=2
pkgdesc='Program to show and manipulate GPS tracks'
arch=(x86_64)
url='https://bourgeoislab.wordpress.com/gpxlab/'
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

  install -Dm755 bin/GPXLab ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 GPXLab/locale/*.qm -t ${pkgdir}/usr/share/${pkgname}/translations
  install -Dm644 doc/gpxlab.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm644 pkg/gpxlab.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 pkg/gpxlab.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
  install -Dm644 pkg/appdata.xml ${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml
}
