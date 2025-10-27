# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: graysky <graysky AT archlinux DOT us>

pkgname=jalbum
_basedir=/usr/lib/$pkgname
pkgver=37.7
pkgrel=2
pkgdesc="Free web photo album software and photo gallery software"
arch=('any')
url="http://jalbum.net/"
license=('LGPL-2.1-or-later' 'BSD-2-Clause' 'BSD-3-Clause' 'Apache-2.0' 'Apache-1.1' 'custom:MX4J' 'custom')
depends=()
source=(
	"$pkgname-$pkgver.zip::http://download.jalbum.net/download/$pkgver/${pkgname/a/A}.zip"
	"$pkgname.desktop"
	"$pkgname.sh")

sha256sums=('950f625fa3e839b542c37f4fe1951cf6bbb435c8325b6aea5551832672d4cc97'
            'ff38b467146b3304edd76c81d058adbe67534a51500886a6bfd1f962ea276901'
            'c32767813689fca7c97af47f9edb1b8a07f0e65e03174d8f8e4f712d9663ac74')

package() {
	depends+=('java-openjfx' 'java-runtime>=24')

	install -Dm644 "$srcdir/jalbum.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm755 "$srcdir/jalbum.sh" "$pkgdir/usr/bin/jalbum"

	install -dm755 "$pkgdir/usr/lib"
	install -dm755 "$pkgdir/usr/share/licenses"
	install -dm755 "$pkgdir/usr/share/pixmaps"

	# install files
	cp -a "${pkgname/a/A}" "$pkgdir/$_basedir"

	# remove windows specific stuff
	find $pkgdir \( -name "*.bat" -o -name "*.cmd" -o -name "*.dll" -o -name "compile.sh" \) -delete

	mv "$pkgdir/$_basedir/license" "$pkgdir/usr/share/licenses/$pkgname"
	ln -s "$_basedir/icons/JalbumApp48.png" "$pkgdir/usr/share/pixmaps/jalbum.png"
}
