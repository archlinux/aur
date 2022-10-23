# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs
pkgver=0.6.4
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=(MIT)
conflicts=('mprocs-bin')
provides=('mprocs')
source=("https://github.com/pvolok/mprocs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fdb5f3f8baaa82ccb7bf2193a7b843027cb133824a99475226524c105255077')
makedepends=(rust)

build() {
	cd mprocs-$pkgver
	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	install -Dm755 "$srcdir/mprocs-$pkgver/target/release/mprocs" \
		"$pkgdir/usr/bin/mprocs"
	install -Dm644 "$srcdir/mprocs-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
