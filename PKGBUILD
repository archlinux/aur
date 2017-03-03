# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=fastqt
pkgver=0.2.2
pkgrel=1
pkgdesc="FastQC port to Qt5: A quality control tool for high throughput sequence data."
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/fastQt"
depends=('qt5-charts' 'karchive' 'hicolor-icon-theme' 'qt5-svg')
source=(https://github.com/labsquare/fastQt/archive/${pkgver}.tar.gz)
sha256sums=('5de44833ad3db38eefe94f0be56a527f4292bb949ef1b5e66fef09cad179348e')

prepare() {
  cd "${srcdir}/fastQt-${pkgver}"
  echo ${pkgdir}
  sed -i "s|target.path.*|target.path = ${pkgdir}/usr/bin|g" FastQt.pro
  sed -i "s|desktop.path.*|desktop.path = ${pkgdir}/usr/share/applications|g" FastQt.pro
  sed -i "s|icons.path.*|icons.path  = ${pkgdir}/usr/share/icons/hicolor/48x48/apps|g" FastQt.pro

}

build() {
  cd "${srcdir}/fastQt-${pkgver}"
  qmake
}

package() {
  cd "${srcdir}/fastQt-${pkgver}"
  make install
}
