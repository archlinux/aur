# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="apertium-caffeine"
pkgver=1.0
pkgrel=3
pkgdesc="A multi-platform Java application built on top of lttoolbox-java that translates as you type."
url="http://wiki.apertium.org/wiki/Apertium-Caffeine"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-environment')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("https://github.com/apertium/${pkgname}/releases/download/v${pkgver}/${pkgname}.jar"
		"https://wiki.apertium.org/images/apertium.png"
)
sha256sums=('27ef7542e0b0f19db7ea46a0a25737ace9c12c29f9c5155e0f2330b4404d216a'
            'ea747ef59b3f8f0cf9b578887b4c48b8b9b16206b7adee1a49d1eee56b16abea')

_apertium_caffeine_desktop="[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=apertium-caffeine
Name=Apertium Caffeine
Icon=apertium-caffeine.png"

build() {
	cd "${srcdir}"
	echo -e "$_apertium_caffeine_desktop" | tee ${pkgname}.desktop
	echo "java -Xmx500m -jar /usr/share/apertium/${pkgname}.jar" > ${pkgname}
}

package() {
	cd "${srcdir}"
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/{apertium,applications,pixmaps,}
	install -m 644 apertium-caffeine.jar "${pkgdir}/usr/share/apertium/"
	install -m 644 *.desktop "${pkgdir}/usr/share/applications/"
	install -m 644 apertium.png "${pkgdir}/usr/share/pixmaps/apertium-caffeine.png"
	install -m 755 ${pkgname} "${pkgdir}/usr/bin/"
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
