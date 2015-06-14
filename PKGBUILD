# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=jskat
_progname=JSkat
pkgver=0.14.4
pkgrel=1
pkgdesc="Free implementation of the German card game Skat in Java."
arch=('any')
url="http://www.jskat.org"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${_progname}-${pkgver}.jar" "${pkgname}.png::http://www.jskat.org/img/jskat_logo.png")
md5sums=('e8800b48e4dfb8da0e61165955490eda' '22e53ed5478bc77a1c0c565d913dcc5b')
noextract=("${_progname}-${pkgver}.jar")

package() {
	install -D -m644 "${srcdir}/${_progname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${_progname}-${pkgver}.jar"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	mkdir -p -m755 "${pkgdir}/usr/bin/" 	
	printf "#!/bin/sh
java -jar /usr/share/java/${pkgname}/${_progname}-${pkgver}.jar
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
