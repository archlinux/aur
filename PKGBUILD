# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
_srcname=SpeedReader
pkgname=${_srcname,,}
pkgver=1.4.0
pkgrel=5
pkgdesc="Cross-platform speed reading developed with Qt"
url="http://www.vanniktech.de/${_srcname}"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('libxkbcommon-x11' 'qt5-base' 'qt5-svg' 'qt5-webkit')
makedepends=('gendesk')
source=("https://github.com/vanniktech/${_srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('c448ac448656eecf52a6a6ed0e71285d32a99e64b6fb225877d366716a83b800')

build() {
  cd "${_srcname}-${pkgver}"
  gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" --categories "Education;Viewer;TextTools;News"
  qmake-qt5 ${_srcname}.pro -r -spec linux-g++
  make
}

package() {
  cd "${_srcname}-${pkgver}"
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm755 ${_srcname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
