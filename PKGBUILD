# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=BourgeoisLab
_pkgname=GPXLab
pkgname=${_pkgname,,}
pkgver=0.4.0
pkgrel=1
pkgdesc='Program to show and manipulate GPS tracks'
arch=('i686' 'x86_64')
url="https://bourgeoislab.wordpress.com/gpxlab/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
        "gpxlab.desktop"
        "gpxlab.diff"
        "gpxlab.xml")
sha256sums=('3b97f0b666479e5a24c1a44c756f1df1c90f786bd721ee3e2348b51db9d787e6'
            'df674c3baa689b5441c81447fa999f418029c1edc5ac1933cdb26202049d2b58'
            '5cd2c5ecf545e884ff66304b3d572e5156f0d63dd6d985aea11fbb8fc3de354f'
            '5e35029c0cf26cbe82c3fbe1f839688f99406c2e054b1311e7912d0468df7c38')

prepare() {
  cd ${_pkgname}-${pkgver}

  patch -Np1 < ../gpxlab.diff
}

build() {
  cd ${_pkgname}-${pkgver}

  qmake GPXLab.pro
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/lib
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages

  install -m 755 bin/GPXLab ${pkgdir}/usr/bin/${pkgname}
  cp -a bin/libqmapcontrol.* ${pkgdir}/usr/lib
  install -m 644 doc/gpxlab.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -m 644 ../gpxlab.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -m 644 ../gpxlab.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
