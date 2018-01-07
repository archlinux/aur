# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=jskat
_progname=JSkat
pkgver=0.16.1
pkgrel=1
pkgdesc="Free implementation of the German card game Skat in Java."
arch=('any')
url="http://www.jskat.org"
license=('GPL3')
depends=('java-runtime' 'bash' 'java-openjfx')
source=("https://github.com/b0n541/jskat-multimodule/releases/download/v${pkgver}/${_progname}-${pkgver}-all.jar" "${pkgname}.png::http://www.jskat.org/img/jskat_logo.png")
sha256sums=('0b726833444459a9ebbd7a2db8993cf5a3565d9bafd4b20c3d3e7bc88b6ac886' 'd459ce6f79b911b0d0b8e2616338bf875f9867c0490ab20bb6241a66ca0b6570')
noextract=("${_progname}-${pkgver}.jar")

package() {
	install -D -m644 "${srcdir}/${_progname}-${pkgver}-all.jar" "${pkgdir}/usr/share/java/${pkgname}/${_progname}-${pkgver}-all.jar"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	mkdir -p -m755 "${pkgdir}/usr/bin/" 	
	printf "#!/bin/sh
java -jar /usr/share/java/${pkgname}/${_progname}-${pkgver}-all.jar
" >> "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p -m755 "${pkgdir}/usr/share/applications/" 
	printf "[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${_progname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Categories=Game
Terminal=false
StartupNotify=true
" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
