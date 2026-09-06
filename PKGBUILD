# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164
pkgname=nlarn
pkgver=0.8.0
pkgrel=1
pkgdesc="A remake of the roguelike game Larn"
arch=('x86_64')
url="https://nlarn.github.io"
license=('GPL-3.0-only')
depends=(glib2 glibc libgcc ncurses zlib)
makedepends=(gcc gettext make)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nlarn/nlarn/releases/download/NLarn-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8f265e30d22c2f366178b0e4133eea852acf697f5b1999e7fa0425026d4fc7cf')

build() {
	cd "$pkgname-$pkgver"
	make config=release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dt "$pkgdir/usr/share/$pkgname" lib/fortune* lib/maze lib/nlarn.hlp* lib/nlarn.msg*
	install -Dt "$pkgdir/usr/share/doc/$pkgname" README.md Changelog.md lib/maze_doc.txt
	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
