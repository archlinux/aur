# New maintainer: patrick <patrick at neumannsland dot de>
# Old maintainer: jerry73204 <jerry73204@gmail.com>
# Created by Gillen Dan

pkgname=fred
pkgver=1.0.0
pkgrel=1
pkgdesc='Digital forensics tool for viewing and reporting on Windows registry files'
arch=('i686' 'x86_64')
url='https://www.sits.lu/fred'
license=('GPL3')
depends=('qt5-base' 'qt5-webengine' 'qt5-script' 'hivex')
source=("https://code.sits.lu/foss/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('cf34ca3fcebf5712ec52e36d8e1b105f3504a7516f0eb530f478159911c3de8f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt5
  make
}

package() {
# Binary
  install -D "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d -m755 "${pkgdir}/usr/share/fred"
  cp -dr "${srcdir}/${pkgname}-${pkgver}/report_templates" "${pkgdir}/usr/share/fred"

# .desktop file and icon
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/src/resources/${pkgname}.desktop" \
	  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/src/resources/${pkgname}.png" \
	  "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
