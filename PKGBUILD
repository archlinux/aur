# Maintainer: Thiago Perrotta <tbperrotta@gmail.com>
pkgname=bkt
pkgver=0.5.0
pkgrel=2
pkgdesc="A subprocess caching utility"
arch=('x86_64')
url="https://www.bkt.rs/"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimo414/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e68b0d22f1262e27dfbdaefe198928a66cb64b69e3ada3e05969a5eb6719bc73')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$srcdir/$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
