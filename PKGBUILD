# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs
pkgver=0.6.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=(MIT)
conflicts=('mprocs-bin')
provides=('mprocs')
source=("https://github.com/pvolok/mprocs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9314e81b0a5584e73a1afc2c1b5b83df0ed31213992447324cb95abbda618ce')
makedepends=(rust)

build() {
	cd mprocs-$pkgver
	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	install -Dm755 "$srcdir/mprocs-$pkgver/target/release/mprocs" \
		"$pkgdir/usr/bin/mprocs"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
