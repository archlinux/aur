# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
pkgname="apertium-viewer"
pkgver="2.5.5"
pkgrel="1"
pkgdesc="A tool to view and edit the output of the various stages of an apertium translation."
url="http://wiki.apertium.org/wiki/Apertium-view"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-environment')
conflicts=("${pkgname}")

source=("https://github.com/apertium/${pkgname}/releases/download/${pkgver}/${pkgname}.jar")
sha256sums=('0bff75df8b36204869ef30bae60671d7226e42d9168dc35442aae88577058d03')

_apertium_viewer_desktop="#!/usr/bin/env xdg-open
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Exec=apertium-viewer 
Name=Apertium Viewer
Icon=apertium.png"

build() {
	cd "${srcdir}"
	echo -e "$_apertium_viewer_desktop" | tee apertium-viewer.desktop
	echo "java -Xmx500m -jar /usr/share/apertium/apertium-viewer.jar" > apertium-viewer
}

package() {
	cd "${srcdir}"
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/{apertium,applications,pixmaps,}
	install -m 644 apertium-viewer.jar "${pkgdir}/usr/share/apertium/"
	install -m 644 *.desktop "${pkgdir}/usr/share/applications/"
	install -m 644 apertiumview/resources/apertium.png "${pkgdir}/usr/share/pixmaps/"
	install -m 755 apertium-viewer "${pkgdir}/usr/bin/"
}

# vim:set ts=4 sw=2 et syn=sh ft=sh:
