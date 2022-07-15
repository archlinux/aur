pkgname=hunt
pkgver=1.7.5
pkgrel=1
pkgdesc="Highly-opinionated simplified Find command made with Rust"
arch=("i686" "x86_64")
url="https://github.com/LyonSyonII/hunt-rs"
license=("Apache")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('cad6b3a85a10feea2acf04bc6ff563889e637856a832629492243cbc75ff5d48')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

#check() {
#	cd "$pkgname-$pkgver"
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --all-features
#}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
