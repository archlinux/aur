# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=berusky
pkgver=1.7.2
pkgrel=1
pkgdesc="A logic game based on the puzzle game Sokoban"
arch=('i686' 'x86_64')
url="https://www.anakreon.cz/berusky1.html"
license=('GPL')
depends=('sdl' 'berusky-data' 'sdl_image')
source=("http://www.anakreon.cz/download/$pkgname-$pkgver.tar.gz"
	berusky.png
	berusky.desktop)
md5sums=('1a9b1387a85885b5d9a30fc681187a86'
         '8a5f5607b4883f4c86d1ba9fd5ab6156'
         '08699c6e9e1004887c3a6f53f2bf797f')

build() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	/bin/sed -i 's|var/games|usr/share|g'	 src/defines.h
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	make DESTDIR="$pkgdir" install
	cd ..
	install -m644 -D berusky.png "$pkgdir"/usr/share/pixmaps/berusky.png
	install -m644 -D berusky.desktop "$pkgdir"/usr/share/applications/berusky.desktop
	mv "$pkgdir/usr/doc" "$pkgdir/usr/share"
}

