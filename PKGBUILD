# New maintainer: patrick <patrick at neumannsland dot de>
# Old maintainer: jerry73204 <jerry73204@gmail.com>
# Created by Gillen Dan

pkgname=fred
pkgver=0.2.0
pkgrel=2
pkgdesc='Digital forensics tool for viewing and reporting on Windows registry files'
arch=('i686' 'x86_64')
url='https://www.pinguin.lu/fred'
license=('GPL3')
depends=('qt5-base' 'qt5-webkit' 'qt5-webengine' 'qt5-script' 'hivex')
#makedepends=('qt5-base' 'qt5-webkit' 'qt5-webengine' 'qt5-script' 'hivex')
source=("http://files.pinguin.lu/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ca6a51d115a1168f7d768e2058d297f4288cce7e554749476cea6e176959561f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5
  make
}

package() {
# Binary
  install -D "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/fred"
  cp -dr "${srcdir}/${pkgname}-${pkgver}/report_templates" "${pkgdir}/usr/share/fred"

# .desktop file and icon
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/resources/${pkgname}.desktop" \
	  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/resources/${pkgname}.png" \
	  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
