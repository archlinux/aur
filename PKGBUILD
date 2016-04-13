# Maintainer: jerry73204 <jerry73204@gmail.com>
# Created by Gillen Dan

pkgname=fred
pkgver=0.1.1
pkgrel=8
pkgdesc='Digital forensics tool for viewing and reporting on Windows registry files'
arch=('i686' 'x86_64')
url='https://www.pinguin.lu/fred'
license=('GPL3')
depends=('qt4' 'hivex')
makedepends=('qtwebkit' 'qt4' 'hivex')
source=("http://files.pinguin.lu/${pkgname}-${pkgver}.tar.gz")
sha1sums=('7d051e364064f17fdba30c9706f8a493f5e97aa0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt4
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
