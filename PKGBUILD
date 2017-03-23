# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=freelib
_pkgname=freeLib
pkgver=5.0
pkgrel=1
pkgdesc="Home library with librusec/flibusta support"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/freelibdesign/"
license=('GPL')
source=('freeLib.desktop' "http://sourceforge.net/projects/freelibdesign/files/${pkgver}/${_pkgname}${pkgver}_source.zip")
depends=('qt5-webkit')
sha1sums=('5edeea4d56f105f7d3898d350c86fc6c5beb32b4'
          'c732dad072786a0c3802d18d0c2e25ba2703a440')
 
build() {
	rm -rf "${srcdir}"/LibOpen/Lib/build && mkdir "${srcdir}"/LibOpen/Lib/build
	cd "${srcdir}"/LibOpen/Lib/build
	qmake ../Lib_linux.pro
	make
} 
 
package() {
	install -d "${pkgdir}"/opt/${pkgname} 
	cp -R "${srcdir}"/LibOpen/Lib/build/src/freeLib "${pkgdir}"/opt/${pkgname}
	cp -R "${srcdir}"/LibOpen/Lib/build/src/Help "${pkgdir}"/opt/${pkgname}
	cp -R "${srcdir}"/LibOpen/Lib/build/src/language "${pkgdir}"/opt/${pkgname}
	cp -R "${srcdir}"/LibOpen/Lib/build/src/xsl "${pkgdir}"/opt/${pkgname}
	cp "${srcdir}"/LibOpen/Lib/src/library.iconset/icon_128x128.png "${pkgdir}"/opt/${pkgname}/${_pkgname}.png

	install -d "${pkgdir}"/usr/share/applications
	cp "${startdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications
}
