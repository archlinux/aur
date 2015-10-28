# Maintainer: Jose Riha <jose1711 gmail com>
pkgname=gpxsee-git
pkgrel=1
pkgver=r28.8a4b749
pkgdesc='GPX viewer and analyzer'
arch=('any')
url="http://tumic.wz.cz/gpxsee"
license=('gpl3')
depends=('qt5-base')
makedepends=('git')
md5sums=('SKIP')

source=("${pkgname}"::'git://github.com/tumic0/GPXSee.git')

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
}
