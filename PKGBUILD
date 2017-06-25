#Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=cutepeaks
_up_pkgname=CutePeaks
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple viewer for Sanger sequencing files"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/${_up_pkgname}"
depends=('karchive' 'qt5-svg' 'hicolor-icon-theme')
source=(https://github.com/labsquare/${_up_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('87aa3e77a9bb2cb01fe3e4684c2d4b7bd753ec833330bb38a3aa1b727c2a71ba')

prepare() {
  cd "${srcdir}/${_up_pkgname}-${pkgver}"
  echo ${pkgdir}
  sed -i "s|target.path.*|target.path = ${pkgdir}/usr/bin|g" ${_up_pkgname}.pro
  sed -i "s|desktop.path.*|desktop.path = ${pkgdir}/usr/share/applications|g" ${_up_pkgname}.pro
  sed -i "s|icons.path.*|icons.path  = ${pkgdir}/usr/share/icons/hicolor/48x48/apps|g" ${_up_pkgname}.pro

}

build() {
  cd "${srcdir}/${_up_pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${_up_pkgname}-${pkgver}"
  make install
}
