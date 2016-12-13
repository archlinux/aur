# Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=hapi-testpanel
pkgver=2.0
pkgrel=1
pkgdesc="HL7 2.x parser with support for traditional (ER7) and XML encoding"
arch=('i686' 'x86_64')
url="http://hl7api.sourceforge.net/"
license=('MPL' 'GPL')
depends=('jre8-openjdk')
makedepends=('imagemagick' 'unzip')
source=("https://freefr.dl.sourceforge.net/project/hl7api/${pkgname}/${pkgver}.${pkgrel}/${pkgname}-${pkgver}.${pkgrel}-linux.tar.bz2"
        "${pkgname}.desktop")
md5sums=('7d4d0f1a4b5502fdd030e14f9be5c1b1'
         '8091c230d65ed7d9ae748ad4dfec2dec')

package() {
	# Creating directories...
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	mkdir -p "${pkgdir}/usr/share/applications"
	
	# Copying files...
	cp "${pkgname}-${pkgver}.${pkgrel}/${pkgname}-${pkgver}.${pkgrel}-jar-with-dependencies.jar" "${pkgdir}/usr/share/${pkgname}"
	cp "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	unzip -p "${pkgname}-${pkgver}.${pkgrel}/${pkgname}-${pkgver}.${pkgrel}-jar-with-dependencies.jar" hapi_64.ico | convert ico:-[3] "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	
	echo \#\!/bin/sh > "${pkgname}.sh"
	echo java -jar /usr/share/${pkgname}/${pkgname}-${pkgver}.${pkgrel}-jar-with-dependencies.jar >> "${pkgname}.sh"
	chmod a+x "${pkgname}.sh"
	mv "${pkgname}.sh" "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

