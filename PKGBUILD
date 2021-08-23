#Maintainer: Direct-A <songyicheng0@gmail.com>

pkgname=cutepeaks-git
_up_pkgname=CutePeaks
pkgver=0.2.3
pkgrel=2
pkgdesc="A simple viewer for Sanger sequencing files"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/labsquare/CutePeaks"
makedepends=('qt5-base' 'qt5-charts' 'make')
optdepends=('qt5-svg: ouput svg support')
conflicts=('cutepeaks')
source=("git+${url}")
sha256sums=('SKIP')

qmake=`whereis qmake | cut -d " " -f 2`

prepare() {
  cd "${srcdir}/${_up_pkgname}"
  sed -i "s|desktop.path.*|target.path = ${pkgdir}/usr/share/applications/|g" src/src.pro
  sed -i "s|icons.path.*|target.path = ${pkgdir}/usr/share/icons/hicolor/64x64/apps/|g" src/src.pro
  sed -i "s|target.path.*|target.path = ${pkgdir}/usr/bin|g" src/src.pro
  sed -i "s|PREFIX = /usr|PREFIX = ${pkgdir}/usr|g" ${pkgname%-*}.pro
}

build() {
  cd "${srcdir}/${_up_pkgname}"
  $qmake --version
  $qmake
  make
}

package() {
  cd "${srcdir}/${_up_pkgname}"
  make install
}
