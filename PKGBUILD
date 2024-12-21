# Maintainer: Thiago Perrotta <tbperrotta@gmail.com>
pkgname=bkt
pkgver=0.8.2
pkgrel=1
pkgdesc="A subprocess caching utility"
arch=('x86_64')
url="https://www.bkt.rs/"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dimo414/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d9128a13070ebc564bcc70210062bdd60eb757fd0f5d075c50e9aa7f714c6562')

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
