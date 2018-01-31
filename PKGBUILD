#Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=cutepeaks
_up_pkgname=CutePeaks
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple viewer for Sanger sequencing files"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/${_up_pkgname}"
depends=('qt5-svg' 'hicolor-icon-theme')
source=(https://github.com/labsquare/${_up_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('7c5b908fa1b6af5022a6ce269aeb399ea13f208f54fd62defcb3287fe1019ca5')

prepare() {
  cd "${srcdir}/${_up_pkgname}-${pkgver}"
  sed -i "s|target.path.*|target.path = ${pkgdir}/usr/bin|g" src/src.pro
  sed -i "s|desktop.path.*|desktop.path = ${pkgdir}/usr/share/applications|g" ${pkgname}.pro
  sed -i "s|icons.path.*|icons.path  = ${pkgdir}/usr/share/icons/hicolor/48x48/apps|g" ${pkgname}.pro
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
