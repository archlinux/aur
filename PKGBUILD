# Contributor: Raffaele Zamorano
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=gpxsee-git
_pkgname=gpxsee
pkgrel=1
pkgver=r794.18fc6cc
pkgdesc='GPX viewer and analyzer'
arch=('any')
url="http://www.gpxsee.org/"
license=('gpl3')
depends=('qt5-tools')
makedepends=('git')
conflicts=('gpxsee')
provides=('gpxsee')
md5sums=('SKIP'
         '4226c05418da218c2a271e1c5d1453fd')

source=("${pkgname}"::git+http://github.com/tumic0/GPXSee
        "gpxsee.desktop")

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  lrelease-qt5 gpxsee.pro
  qmake gpxsee.pro
  make
}

package() {
  cd "${pkgname}"

  install -d 755 ${pkgdir}/usr/bin
  install -d 755 ${pkgdir}/usr/share/applications
  install -d 755 ${pkgdir}/usr/share/pixmaps
  install -d 755 ${pkgdir}/usr/share/mime/packages
  install -d 755 ${pkgdir}/usr/share/${_pkgname}
  install -d 755 ${pkgdir}/usr/share/${_pkgname}/maps
  install -d 755 ${pkgdir}/usr/share/${_pkgname}/csv
  install -d 755 ${pkgdir}/usr/share/${_pkgname}/translations

  install -m 755 GPXSee ${pkgdir}/usr/bin/${_pkgname}
  install -m 644 pkg/maps/* ${pkgdir}/usr/share/${_pkgname}/maps
  install -m 644 pkg/csv/* ${pkgdir}/usr/share/${_pkgname}/csv
  install -m 644 lang/*.qm ${pkgdir}/usr/share/${_pkgname}/translations
  install -m 644 icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png
  install -m 644 pkg/gpxsee.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -m 644 pkg/gpxsee.xml ${pkgdir}/usr/share/mime/packages/${_pkgname}.xml
}
