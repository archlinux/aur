# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs
pkgver=0.6.2
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=(MIT)
conflicts=('mprocs-bin')
provides=('mprocs')
source=("https://github.com/pvolok/mprocs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9fa61b31fa6b6eeb3ccc018d806b9e672bb66d63c581f15ba8f409f32bca7742')
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
