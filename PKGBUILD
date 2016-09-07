# Maintainer: Josh Mandle <difarem@gmail.com>

pkgname=smw-git
pkgver=1.8.beta2
pkgrel=1
pkgdesc='Super Mario multiplayer game.'
url='http://smw.supersanctuary.net/site/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
makedepends=('git')
provides=('smw')
conflicts=('smw-svn')

source=('git://github.com/erlehmann/Super-Mario-War.git' 'build.patch'
		'smw.desktop' 'smw-leveledit.desktop' 'smw-worldedit.desktop'
		'smw.png' 'smw-leveledit.png' 'smw-worldedit.png')
md5sums=('SKIP' '8ccb01b1497ef9973fbf39eb9cfae576'
		'b4efac68e43d10d56d04ebb836407113' '7035fa75a0283b34664a996e1e8b3baa' 'b0ea8ca8fb8b0a5f74ed69d402f26775'
		'58a1731de3de9d46c14d400ad2c6acdc' '8ceb70b9311fde38e4fa598daf8c9f2b' '0f5f9cfa11d102d9693d37b841c756aa')

prepare() {
	cd -- "$srcdir/Super-Mario-War"
	patch -Np1 <../../build.patch
}

build() {
	cd -- "$srcdir/Super-Mario-War"
	./configure
	make -j3
}

package() {
	install -Dm644 "smw.desktop" "$pkgdir/usr/share/applications/smw.desktop"
	install -Dm644 "smw-leveledit.desktop" "$pkgdir/usr/share/applications/smw-leveledit.desktop"
	install -Dm644 "smw-worldedit.desktop" "$pkgdir/usr/share/applications/smw-worldedit.desktop"
	
	install -Dm644 "smw.png" "$pkgdir/usr/share/pixmaps/smw.png"
	install -Dm644 "smw-leveledit.png" "$pkgdir/usr/share/pixmaps/smw-leveledit.png"
	install -Dm644 "smw-worldedit.png" "$pkgdir/usr/share/pixmaps/smw-worldedit.png"

	cd -- "$srcdir/Super-Mario-War"
	
	make DESTDIR="$pkgdir" install
}
