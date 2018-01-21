# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=fastqt
pkgver=0.2.3
pkgrel=2
pkgdesc="FastQC port to Qt5: A quality control tool for high throughput sequence data."
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/fastQt"
depends=('qt5-charts' 'karchive' 'hicolor-icon-theme' 'qt5-svg')
source=(https://github.com/labsquare/fastQt/archive/${pkgver}.tar.gz)
sha256sums=('58b20dd5ece5aaf040ec8435de913170614e2a3217feeb6a00bc17f3eca87af0')

prepare() {
  cd "${srcdir}/FastQt-${pkgver}"
  echo ${pkgdir}
  sed -i "s|target.path.*|target.path = ${pkgdir}/usr/bin|g" FastQt.pro
  sed -i "s|desktop.path.*|desktop.path = ${pkgdir}/usr/share/applications|g" FastQt.pro
  sed -i "s|icons.path.*|icons.path  = ${pkgdir}/usr/share/icons/hicolor/48x48/apps|g" FastQt.pro

}

build() {
  cd "${srcdir}/FastQt-${pkgver}"
  qmake
}

package() {
  cd "${srcdir}/FastQt-${pkgver}"
  make install
}
