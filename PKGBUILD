# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=zplit
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightweight terminal multiplexer written in Zig, a single static client/server binary"
arch=('x86_64' 'aarch64')
url="https://github.com/midasdf/zplit"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.16.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c42ece6cd3c9776fc6d389921bcd1853a8866db3ada38cc1c2002c4b0ee2c833')

build() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build -Doptimize=ReleaseSafe -Dcpu=baseline
}

check() {
	cd "$pkgname-$pkgver"
	export ZIG_GLOBAL_CACHE_DIR="$srcdir/zig-global-cache"
	zig build test -Dcpu=baseline
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 zig-out/bin/zplit "$pkgdir/usr/bin/zplit"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
