# Maintainer: András Wacha <awacha@gmail.com>
pkgname=jchempaint
pkgver=3.3.1210
pkgver_original=3.3-1210
pkgrel=1
pkgdesc=""
arch=( x86_64 )
url="jchempaint.github.io"
license=('GPL')
depends=(java-runtime)
source=("https://github.com/downloads/JChemPaint/jchempaint/${pkgname}-${pkgver_original}.jar")
md5sums=('2732ecc2e01759ba91619398ff0fe614')
noextract=("${pkgname}-${pkgver_original}.jar")

prepare() {
	jar -xf jchempaint-${pkgver_original}.jar org/openscience/jchempaint/resources/large-bin/icon_large.gif
	mv org/openscience/jchempaint/resources/large-bin/icon_large.gif jchempaint.gif
}

package() {
	mkdir -p $pkgdir/usr/share/java/jchempaint
	cp jchempaint-${pkgver_original}.jar $pkgdir/usr/share/java/jchempaint/jchempaint.jar
	mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
	cp jchempaint.gif $pkgdir/usr/share/icons/hicolor/128x128/apps
	mkdir -p $pkgdir/usr/bin
	cat >$pkgdir/usr/bin/jchempaint <<EOF
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/jchempaint/jchempaint.jar' "\$@"
EOF
	chmod +x $pkgdir/usr/bin/jchempaint
}
