# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=where-is-m13
pkgver=2.3
pkgrel=1
pkgdesc="Application to visualize the locations and physical properties of deep sky objects."
arch=(any)
url="http://www.thinkastronomy.com/M13/index.html"
license=('Custom:ThinkAstronomy')
depends=('jre8-openjdk')
source=("$pkgname-$pkgver.zip"::"http://www.thinkastronomy.com/M13/downloads/WhereIsM13_$pkgver.zip")
sha256sums=("b9152359584a7f2283560559fdf35348e018254ae965cdbfa624c662687ccadc")

package() {

	cd "$srcdir/Where is M13"
	
	_binary="$pkgdir/usr/bin/whereism13"
	install	-d "$pkgdir/usr/bin"	
	echo 	"#!/bin/bash" >> "$_binary"
	echo 	"java -jar /usr/lib/$pkgname/WhereIsM13.jar" >> "$_binary"
	chmod	+x "$pkgdir/usr/bin/whereism13"
	
	# TODO: Find icon files for this application
	_desktop="$pkgdir/usr/share/applications/whereism13.desktop"
	install -d "$pkgdir/usr/share/applications"
	echo	"[Desktop Entry]" >> "$_desktop"
	echo	"Name=Where Is M13" >> "$_desktop"
	echo	"Comment=Visualize the locations and physical properties of deep sky objects." \
		>> "$_desktop"	
	echo	"Exec=/usr/bin/whereism13" >> "$_desktop"
	echo	"Icon=" >> "$_desktop"
	echo	"Terminal=false" >> "$_desktop"
	echo	"Type=Application" >> "$_desktop"
	echo	"Encoding=UTF-8" >> "$_desktop"
	echo	"Categories=Graphics;" >> "$_desktop"
	
	install	-d   "$pkgdir/usr/lib/$pkgname"
	cp	-r * "$pkgdir/usr/lib/$pkgname/"
	chmod	+x   "$pkgdir/usr/lib/$pkgname/WhereIsM13.jar"
	
	install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
