# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=skatgui
_progname=SkatGUI
pkgver=14.11033.16
pkgrel=2
pkgdesc="A graphical user interface for the International Skat Server (ISS)."
arch=('any')
url="https://skatgame.net/iss/software.html"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("https://skatgame.net/iss/${pkgname}.jar" "${pkgname}.png")
md5sums=('111c4e9d9867c7d5fcd84ae3ddfcb85f' '4e22ffdc0f1016e63102958d902e9140')
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
