#Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=cutepeaks
_up_pkgname=CutePeaks
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple viewer for Sanger sequencing files"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/${_up_pkgname}"
depends=('qt5-svg' 'hicolor-icon-theme')
source=(https://github.com/labsquare/${_up_pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('702ca8363080e865d2b4e4c9d30fb92abd8a4cc35bced85a7fe34468d1057ecf')

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
