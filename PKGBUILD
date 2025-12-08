# Maintainer: Ethan THIERRY <ethan@thierry.id>
pkgname=liskvork
pkgver=0.6.1
pkgrel=2
pkgdesc="Modern multi-platform gomoku game server"
arch=('x86_64')
url="https://liskvork.org"
license=('EUPL')
makedepends=('zig>=0.15' 'zig<0.16' 'git' 'scdoc')
source=("$pkgname-r$pkgver::https://git.sr.ht/~emneo/liskvork/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	zig build -Dbin_name=$pkgname -Dversion=$pkgver -Doptimize=ReleaseSafe -Dman_pages
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./zig-out/bin/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm655 ./zig-out/doc/$pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
