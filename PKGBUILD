# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="apertium-viewer"
pkgver=2.5.2
pkgrel=1
pkgdesc="A tool to view and edit the output of the various stages of an apertium translation."
url="http://wiki.apertium.org/wiki/Apertium-view"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-environment')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("https://svn.code.sf.net/p/apertium/svn/builds/apertium-viewer/apertium-viewer.jar")
sha256sums=('de5e7367ec2b890c1d3a97c75ba0819d25ff78b393154cc190e1324ca509e062')
options=()

_apertium_viewer_desktop="[Desktop Entry]
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

# vim:set ts=4 sw=2 ft=sh et: