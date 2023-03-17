# Maintainer: Max le Fou (buttbadger at gmail dot com)

pkgname=ultrastar-creator
pkgver=git.latest
pkgrel=8
pkgdesc="Qt program used to generate USDX songs from scratch"
url=https://github.com/UltraStar-Deluxe/UltraStar-Creator
license=('GPL2')
arch=('x86_64')

depends=('qt5-base' 'qt5-tools' 'git' 'libbass' 'taglib' 'cld2-git')

source=('git+https://github.com/UltraStar-Deluxe/UltraStar-Creator.git'
        'ultrastar-creator.desktop'
        'ultrastar-creator')

md5sums=('SKIP'
         'f5fbb7d6e481005d7b90b738ef04957f'
         'f5ff1a7eb66be5ee58c3dcec1d6f3f54')
	
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
        install -Dm755 "ultrastar-creator" "${pkgdir}/usr/bin/ultrastar-creator"
	install -Dm644 "$srcdir/UltraStar-Creator/setup/unix/UltraStar-Creator.png" "${pkgdir}/usr/share/pixmaps/UltraStar-Creator.png"
	
	cd "$srcdir/UltraStar-Creator/bin/release"
	install -Dm755 "UltraStar-Creator" "$pkgdir/opt/$pkgname/UltraStar-Creator"
	
	cd "$srcdir/UltraStar-Creator/bin/release/lib"
	install -Dm644 "libbass.so" "$pkgdir/opt/$pkgname/lib/libbass.so"
	install -Dm644 "libbass_fx.so" "$pkgdir/opt/$pkgname/lib/libbass_fx.so"
	
	cd "$srcdir/UltraStar-Creator/bin/release"
}
