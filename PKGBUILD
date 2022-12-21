# Maintainer: András Wacha <awacha@gmail.com>
pkgname=jchempaint
pkgver=3.3.1210
_pkgver_original=3.3-1210
pkgrel=3
pkgdesc="Chemical 2D structure editor application/applet based on the Chemistry Development Kit"
arch=( x86_64 )
url="https://github.com/JChemPaint/jchempaint"
license=('GPL')
depends=(java-environment)
makedepends=(imagemagick)
source=("https://github.com/downloads/JChemPaint/jchempaint/${pkgname}-${_pkgver_original}.jar")
md5sums=('2732ecc2e01759ba91619398ff0fe614')
noextract=("${pkgname}-${_pkgver_original}.jar")

prepare() {
	jar -xf jchempaint-${_pkgver_original}.jar org/openscience/jchempaint/resources/large-bin/icon_32x32.gif
	mv org/openscience/jchempaint/resources/large-bin/icon_32x32.gif jchempaint.gif
	convert jchempaint.gif jchempaint.png
}

package() {
	mkdir -p $pkgdir/usr/share/java/jchempaint
	cp jchempaint-${_pkgver_original}.jar $pkgdir/usr/share/java/jchempaint/jchempaint.jar
	mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
	cp jchempaint.png $pkgdir/usr/share/icons/hicolor/32x32/apps
	mkdir -p $pkgdir/usr/bin
	cat >$pkgdir/usr/bin/jchempaint <<EOF
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/jchempaint/jchempaint.jar' "\$@"
EOF
	chmod +x $pkgdir/usr/bin/jchempaint
	mkdir -p $pkgdir/usr/share/applications
	cat >$pkgdir/usr/share/applications/jchempaint.desktop <<EOF
[Desktop Entry]
Version=1.0
Name=JChemPaint
GenericName=2D Chemistry Drawing
Exec=/usr/bin/jchempaint
Icon=jchempaint %u
Categories=Science;Chemistry;Education
EOF
}
