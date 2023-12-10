# Maintainer: Max le Fou (buttbadger at gmail dot com)

pkgname=ultrastar-creator
pkgver=1.3.0
pkgrel=2
pkgdesc="Qt program used to generate USDX songs from scratch"
url=https://github.com/UltraStar-Deluxe/UltraStar-Creator
license=('GPL2')
arch=('x86_64')

depends=('qt6-base' 'qt6-tools' 'git' 'libbass' 'taglib' 'cld2-git')

source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
        'ultrastar-creator.desktop'
        'ultrastar-creator')

md5sums=('5e994a6d9ab19452509a7f6907a1e004'
         'f5fbb7d6e481005d7b90b738ef04957f'
         'f5ff1a7eb66be5ee58c3dcec1d6f3f54')
	
build()
{
	cd "$srcdir/UltraStar-Creator-${pkgver}/src/"
	qmake6 UltraStar-Creator.pro
	make
}
	
package()
{
	cd ..
	install -Dm644 "ultrastar-creator.desktop" "${pkgdir}/usr/share/applications/ultrastar-creator.desktop"
        install -Dm755 "ultrastar-creator" "${pkgdir}/usr/bin/ultrastar-creator"
	install -Dm644 "$srcdir/UltraStar-Creator-${pkgver}/setup/unix/UltraStar-Creator.png" "${pkgdir}/usr/share/pixmaps/UltraStar-Creator.png"
	
	cd "$srcdir/UltraStar-Creator-${pkgver}/bin/release"
	install -Dm755 "UltraStar-Creator" "$pkgdir/opt/$pkgname/UltraStar-Creator"
	
	cd "$srcdir/UltraStar-Creator-${pkgver}/bin/release/lib"
	install -Dm644 "libbass.so" "$pkgdir/opt/$pkgname/lib/libbass.so"
	install -Dm644 "libbass_fx.so" "$pkgdir/opt/$pkgname/lib/libbass_fx.so"
	
	cd "$srcdir/UltraStar-Creator-${pkgver}/bin/release"
}
