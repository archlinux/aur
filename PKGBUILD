# Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=hl7inspector
pkgver=2.2.0.554
pkgrel=1
pkgdesc="hl7 tool for integration the HL7 in a health care environmental"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/hl7inspector/"
license=('GPLv2')
depends=('jre8-openjdk')
makedepends=('imagemagick' 'unzip')
source=("https://heanet.dl.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-jar-with-dependencies.jar"
        "${pkgname}.desktop")
md5sums=('f429fb715ec3f4573aa09067af8f6841'
         'f46523a0f05ac9ca6fb2a34962d28021')

package() {
	# Creating directories...
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	mkdir -p "${pkgdir}/usr/share/applications"
	
	# Copying files...
	cp "${pkgname}-jar-with-dependencies.jar" "${pkgdir}/usr/share/${pkgname}"
	cp "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
	unzip -p "${pkgname}-jar-with-dependencies.jar" de/elomagic/hl7inspector/resources/64x64/hl7inspector.png > "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	
	echo \#\!/bin/sh > "${pkgname}.sh"
	echo java -jar /usr/share/${pkgname}/${pkgname}-jar-with-dependencies.jar >> "${pkgname}.sh"
	chmod a+x "${pkgname}.sh"
	mv "${pkgname}.sh" "${pkgdir}/usr/share/${pkgname}"
	ln -s "/usr/share/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

