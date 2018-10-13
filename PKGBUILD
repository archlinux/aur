# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=jalbum
_basedir=/usr/lib/$pkgname
pkgver=16.2
pkgrel=1
pkgdesc="Free web photo album software and photo gallery software"
arch=('any')
url="http://jalbum.net/"
license=('custom' 'lgpl')
depends=('java-openjfx')
source=("$pkgname-$pkgver.zip::http://download.jalbum.net/download/$pkgver/${pkgname/a/A}.zip"
"$pkgname.desktop"
"$pkgname.sh")

sha256sums=('2a3ce87e883b39d44b29f598dcf67310e39049f609da83f9b7d0086db291b058'
            '9679ab294b5c5e0ad343b8a12026073fd2f622320d636cc05facaa2ff5b15825'
            'f4aec4248de127251fc32571732e91fd860f1954c650650a965bf77759cd85fc')

package() {
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
