# Maintainer: Aaron Friesen <aaron@frie.dev>
pkgname=nlarn
pkgver=0.7.9
pkgrel=1
pkgdesc="A remake of the roguelike game Larn"
arch=('x86_64')
url="https://nlarn.github.io"
license=('GPL-3.0-only')
depends=(glib2 glibc libgcc ncurses zlib)
makedepends=(gcc make)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nlarn/nlarn/releases/download/NLarn-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('63a3341da5a8a00ab90c88d472a5e552d93754af2dc1d07f76c17f32cc9d8029')

build() {
	cd "$pkgname-$pkgver"
	make config=release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dt "$pkgdir/usr/share/$pkgname" lib/fortune lib/maze lib/nlarn.hlp lib/nlarn.msg
	install -Dt "$pkgdir/usr/share/doc/$pkgname" README.md Changelog.md lib/maze_doc.txt
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
