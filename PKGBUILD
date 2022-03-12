# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>
pkgname=jskat
_progname=jskat-linux
pkgver=0.20.0
pkgrel=1
pkgdesc="Free implementation of the German card game Skat in Java."
arch=('any')
url="http://www.jskat.org"
license=('GPL3')
depends=('java-runtime=17' 'bash' 'archlinux-java-run')
source=("${_progname}-${pkgver}.jar::https://github.com/b0n541/jskat-multimodule/releases/download/v${pkgver}/JSkat-${pkgver}-linux.jar" "${pkgname}.png::http://www.jskat.org/img/jskat_logo.png")
sha256sums=('e80a20f7d597efe17c3a88efc8f4d63fe6aa2f9023f53d08fc7d145c1d10dd13'
            'd459ce6f79b911b0d0b8e2616338bf875f9867c0490ab20bb6241a66ca0b6570')
noextract=("${_progname}-${pkgver}.jar")

package() {
	install -D -m644 "${srcdir}/${_progname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${_progname}-${pkgver}.jar"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	mkdir -p -m755 "${pkgdir}/usr/bin/"
	printf "#!/bin/sh
archlinux-java-run --min 17 --max 17 -- -jar /usr/share/java/${pkgname}/${_progname}-${pkgver}.jar
" >> "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	mkdir -p -m755 "${pkgdir}/usr/share/applications/"
	printf "[Desktop Entry]
Version=${pkgver}
Type=Application
Name=JSkat
Comment=${pkgdesc}
Exec=${pkgname}
Icon=${pkgname}
Categories=Game
Terminal=false
StartupNotify=true
" >> "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
