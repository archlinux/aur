# Maintainer:	M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=where-is-m13
pkgver=2.3
pkgrel=3
pkgdesc="Application to visualize the locations and physical properties of deep sky objects."
arch=('any')
url="http://www.thinkastronomy.com/M13/index.html"
license=('Custom:ThinkAstronomy')
depends=('java-runtime')
source=("$pkgname-$pkgver.zip"::"http://www.thinkastronomy.com/M13/downloads/WhereIsM13_$pkgver.zip"
	"$pkgname-$pkgver-icons.tar.gz"::"https://github.com/Poultryphile/$pkgname-icons/archive/icons-$pkgver.tar.gz")
sha256sums=("b9152359584a7f2283560559fdf35348e018254ae965cdbfa624c662687ccadc"
	    "cf39f4f68a3e231fc8cbae0b7a68f38d3a556d96e80bba65e9c6b75bc2bedaf1")

package() {
	cd "$srcdir/Where is M13"
	
	_binary="$pkgdir/usr/bin/whereism13"
	install	-d "$pkgdir/usr/bin"	
	echo 	"#!/bin/bash" >> "$_binary"
	echo 	"java -jar /usr/lib/$pkgname/WhereIsM13.jar" >> "$_binary"
	chmod	+x "$pkgdir/usr/bin/whereism13"
	
	_desktop="$pkgdir/usr/share/applications/whereism13.desktop"
	install -d "$pkgdir/usr/share/applications"
	echo	"[Desktop Entry]" >> "$_desktop"
	echo	"Name=Where Is M13" >> "$_desktop"
	echo	"Comment=Visualize the locations and physical properties of deep sky objects." \
		>> "$_desktop"	
	echo	"Exec=/usr/bin/whereism13" >> "$_desktop"
	echo	"Icon=m13" >> "$_desktop"
	echo	"Terminal=false" >> "$_desktop"
	echo	"Type=Application" >> "$_desktop"
	echo	"Encoding=UTF-8" >> "$_desktop"
	echo	"Categories=Graphics;" >> "$_desktop"
	
	install	-d   "$pkgdir/usr/lib/$pkgname"
	cp	-r * "$pkgdir/usr/lib/$pkgname/"
	chmod	+x   "$pkgdir/usr/lib/$pkgname/WhereIsM13.jar"
	
	install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	cd "$srcdir/$pkgname-icons-icons-$pkgver"
	
	_icondir="$pkgdir/usr/share/icons/hicolor"
	install -Dm 644 "m13.svg" "$_icondir/scalable/m13.svg"
	
	for _size in "16" "32" "48" "256" "512" ; do
		install -Dm 644 "$_size.png" "$_icondir/$_size""x""$_size/apps/m13.png"
	done
}
