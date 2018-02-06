# Contributor: Raffaele Zamorano
# Contributor: Jose Riha <jose1711 gmail com>
# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=gpxsee
pkgver=4.19
pkgrel=1
pkgdesc='GPX viewer and analyzer'
arch=('i686' 'x86_64')
url="http://www.gpxsee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/tumic0/GPXSee/archive/${pkgver}.tar.gz"
        "gpxsee.desktop")
sha256sums=('8f0718a59772e1bddd3b33214ecf0b9a64f46f68f4de56481c7606dea87c4002'
            '623e9967a86c15aa812ef48bc60f5939da62c43f9d53cbdd6418381441ebb6be')

build() {
  cd GPXSee-${pkgver}

  lrelease gpxsee.pro
  qmake gpxsee.pro
  make
}

package() {
  cd GPXSee-${pkgver}

  install -Dm755 GPXSee ${pkgdir}/usr/bin/gpxsee
  install -Dm644 pkg/maps.txt ${pkgdir}/usr/share/gpxsee/maps.txt
  install -Dm644 icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/gpxsee.png
  install -Dm644 ${srcdir}/gpxsee.desktop ${pkgdir}/usr/share/applications/gpxsee.desktop
}
