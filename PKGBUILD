# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=skatgui
_progname=SkatGUI
pkgver=14.11033.16
pkgrel=3
pkgdesc="A graphical user interface for the International Skat Server (ISS)."
arch=('any')
url="https://skatgame.net/iss/software.html"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("https://skatgame.net/iss/${pkgname}.jar" "${pkgname}.png")
sha256sums=('7ebccdbc11b7192a92613940d462b84bbe452e717ca34eb6dbf7108f8968e724' '7d9224c79d4bc8a07a7e49d9764e20dc4e4f0fd4252b94841f3c8e2b984d52cd')
noextract=("${pkgname}.jar")

package() {
	install -D -m644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	mkdir -p -m755 "${pkgdir}/usr/bin/" 	
	printf "#!/bin/sh
mkdir -p -m 755 ~/.${pkgname}
cd ~/.${pkgname}
java -jar /usr/share/java/${pkgname}/${pkgname}.jar
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
