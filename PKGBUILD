# Maintainer: kinker31 <dp223171@gmail.com>
pkgname=chocolate-quake
pkgver=2.0.0
pkgrel=1
pkgdesc="Conservative source port of Quake I"
#32-bit support do be experimental, if it doesn't work, I'll just keep it at x64.
arch=('x86_64' 'arm64' 'i686')
url="https://github.com/Henrique194/chocolate-quake"
license=('GPL-3.0-only')
depends=('sdl2')
makedepends=('cmake' 'gcc' 'git')
conflicts=('chocolate-quake-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Henrique194/chocolate-quake/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('f617e37bc2e8c0a9e83bf1191216091be7b2040e5e763de26a0cc661dd82d73f')

build() {
	cd "$pkgname-$pkgname-$pkgver/"
	mkdir build	
	cmake -S ./ -B build/
	cmake --build build/ 
}

package() {
	cd "$pkgname-$pkgname-$pkgver/"
	install -Dm755 build/src/chocolate-quake "$pkgdir/usr/bin/chocolate-quake"
	mkdir -p "$pkgdir/usr/share/doc/chocolate-quake/"
	mkdir -p "$pkgdir/usr/share/licenses/chocolate-quake/"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/chocolate-quake/changelog.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/chocolate-quake/readme.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chocolate-quake/LICENSE"
	install -Dm644 "./dist/linux/io.github.henrique194.chocolate-quake.desktop" "$pkgdir/usr/share/applications/chocolate-quake.desktop"
	install -Dm644 "./dist/linux/io.github.henrique194.chocolate-quake.svg" "$pkgdir/usr/share/pixmaps/chocolate-quake.svg"
}

post_upgrade() {
	cat <<- EOF
		:: You need the Quake data (.pak) files to play.
		:: pak0.pak to play the shareware episode and/or
		:: additionally pak1.pak for the whole game.
		::
		:: Make sure you set the working direcrory of the
		:: Desktop file to somewhere you have them
		:: installed!
	EOF
}
