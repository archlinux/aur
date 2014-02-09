# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>
# Contributor: Stefano "GeniE" Faraone <xgotux@gmail.com>

pkgname=njam
pkgver=1.25
pkgrel=8
pkgdesc="Full-featured cross-platform pacman-like game"
arch=('i686' 'x86_64')
url="http://njam.sourceforge.net/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_net')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz njam.desktop njam-1.25-gcc45-archlinux.patch)
md5sums=('b49f65a0c5df83de85df4f985337e2eb' 'a2e8f7e419de1b864c31342003ebcd4d' '0add7095857fe517d35abdbd79e25259')

prepare() {
	cd "$srcdir/$pkgname-$pkgver-src"
	patch -p0 < "$srcdir/njam-1.25-gcc45-archlinux.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver-src"
	./configure --prefix=/usr
	make clean # Delete the binary files which are distributed in the tar file
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver-src"
	make DESTDIR="$pkgdir/" install
	chgrp root "$pkgdir/usr/share/njam/hiscore.dat"
	chmod 644 "$pkgdir/usr/share/njam/hiscore.dat"
	install -Dm644 njamicon.ico "$pkgdir/usr/share/pixmaps/njamicon.ico"
	install -Dm644 "$srcdir/njam.desktop" "$pkgdir/usr/share/applications/njam.desktop"
}
