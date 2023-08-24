# Maintainer: Ratakor <ratakor@disroot.org>

pkgname=2048.zig
_pkgname=${pkgname%.zig}
pkgver=0.1.2
pkgrel=1
pkgdesc="2048 in zig"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ratakor/$pkgname"
license=('ISC')
depends=('zig')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/archive/$pkgver/$pkgname.tar.gz")
sha256sums=('660200920edd8151b01248141719a07f3af88d46bcd2d09f989bd16d01234ad9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	zig build -Doptimize=ReleaseSafe
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm755 "zig-out/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
