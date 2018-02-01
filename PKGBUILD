#Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=cutepeaks
_up_pkgname=CutePeaks
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple viewer for Sanger sequencing files"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/${_up_pkgname}"
depends=('qt5-svg' 'hicolor-icon-theme')
source=(https://github.com/labsquare/${_up_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('d6894741fb8afc537c9f9133ceb01d65a69180ff7ef69b0399922586b33e2609')

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
