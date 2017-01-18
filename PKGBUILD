# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=fastqt
pkgver=0.1
pkgrel=1
pkgdesc="FastQC port to Qt5: A quality control tool for high throughput sequence data."
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/fastQt"
depends=('qt5-charts' 'karchive' 'hicolor-icon-theme')
source=(https://github.com/labsquare/fastQt/archive/${pkgver}.tar.gz)
sha256sums=('b698aec72dd27735303408b1a0ba8a22e18bf1eef3c699e1494e44d0c478e0aa')

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
