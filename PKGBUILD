# Maintainer: Max le Fou (buttbadger at gmail dot com)

pkgname=ultrastar-creator
pkgver=git.latest
pkgrel=1
pkgdesc="Qt program used to generate USDX songs from scratch"
url=https://github.com/UltraStar-Deluxe/UltraStar-Creator
license=('GPL2')
arch=('i686' 'x86_64')

depends=('qt5-base' 'qt5-tools')

source=('git://github.com/UltraStar-Deluxe/UltraStar-Creator.git'
		'ultrastar-creator.desktop')

md5sums=('SKIP'
		 'f9458d9b3feb7cf0d84b727ad34ae689')
	
build()
{
	cd "$srcdir/UltraStar-Creator/src"
	qmake UltraStar-Creator.pro
	make
}
	
package()
{
	cd ..
	install -Dm644 "ultrastar-creator.desktop" "${pkgdir}/usr/share/applications/ultrastar-creator.desktop"
	install -Dm644 "$srcdir/UltraStar-Creator/setup/unix/UltraStar-Creator.png" "${pkgdir}/usr/share/pixmaps/UltraStar-Creator.png"
	
	cd "$srcdir/UltraStar-Creator/bin/release"
	install -Dm755 "UltraStar-Creator" "$pkgdir/opt/$pkgname/UltraStar-Creator"
	
	cd "$srcdir/UltraStar-Creator/bin/release/lib"
	install -Dm644 "libbass.so" "$pkgdir/opt/$pkgname/lib/libbass.so"
	install -Dm644 "libbass_fx.so" "$pkgdir/opt/$pkgname/lib/libbass_fx.so"
	
	cd "$srcdir/UltraStar-Creator/bin/release"
}