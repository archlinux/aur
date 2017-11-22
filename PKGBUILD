# Contributor: Raffaele Zamorano
# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=gpxsee-git
pkgrel=1
pkgver=r673.443b916
pkgdesc='GPX viewer and analyzer'
arch=('any')
url="http://www.gpxsee.org/"
license=('gpl3')
depends=('qt5-tools')
makedepends=('git')
md5sums=('SKIP')

source=("${pkgname}"::git+http://github.com/tumic0/GPXSee)

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
  install -Dm755 ${srcdir}/${pkgname}/GPXSee ${pkgdir}/usr/bin/GPXSee
  install -Dm644 ${srcdir}/${pkgname}/src/maps.txt ${pkgdir}/usr/share/GPXSee/maps.txt
}
