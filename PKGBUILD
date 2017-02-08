# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=jalbum
_basedir=/usr/lib/$pkgname
pkgver=13.10
pkgrel=1
pkgdesc="free web photo album software and photo gallery software"
arch=('any')
url="http://jalbum.net/"
license=('custom' 'lgpl')
depends=('java-openjfx')
source=("http://download.jalbum.net/download/$pkgver/${pkgname/a/A}.zip"
"$pkgname.desktop"
"$pkgname.sh")

sha256sums=('950775fcc00b1be9bdb9c53371e3b5564f10851939cbce2c37a1658a4cec2b03'
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
