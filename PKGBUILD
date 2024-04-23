# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: Petr Malat <petris@penguin.cz> 

pkgname='tong'
pkgver='1.3'
pkgrel='5'
pkgdesc="Tetris meets Pong, with more twists than a contortionist club's secret handshake"
arch=('i686' 'x86_64')
url="https://tong.nongnu.org/"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'sdl_image' 'sdl_mixer' 'sdl12-compat')
source=("http://tong.nongnu.org/$pkgname-$pkgver.tar.gz"
	"$pkgname.desktop")
md5sums=('a9d70c7b2f637e9d95e6fbdf6d22782d'
	'4c99f05484e5c60708fd14272af2e357')

build() {
	cd "$srcdir/$pkgname"
	make GAME_DATA_DIR="/usr/share/$pkgname"
}

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname"
	
	# Copy files and binary on appropriate destinations
	cd "$srcdir/$pkgname"
	cp -r media "$pkgdir/usr/share/$pkgname/"
	install -m644 CREDITS "$pkgdir/usr/share/$pkgname/CREDITS"
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	
	# Remove unneeded folders
	rm -r "$pkgdir/usr/share/$pkgname/media/"{gp2x,wii}
	
	# Install a desktop entry
	install -Dm644 media/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
