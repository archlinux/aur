# Contributor: Raffaele Zamorano
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=gpxsee-git
pkgrel=1
pkgver=r699.53a4b45
pkgdesc='GPX viewer and analyzer'
arch=('any')
url="http://www.gpxsee.org/"
license=('gpl3')
depends=('qt5-tools')
makedepends=('git')
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
  install -Dm755 ${srcdir}/${pkgname}/GPXSee ${pkgdir}/usr/bin/gpxsee
  install -Dm644 ${srcdir}/${pkgname}/pkg/maps.txt ${pkgdir}/usr/share/gpxsee/maps.txt
  install -Dm644 ${srcdir}/${pkgname}/icons/gpxsee.png ${pkgdir}/usr/share/pixmaps/gpxsee.png
  install -Dm644 ${srcdir}/gpxsee.desktop ${pkgdir}/usr/share/applications/gpxsee.desktop
}
