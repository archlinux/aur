pkgname=hunt
pkgver=1.7.6
pkgrel=1
pkgdesc="Highly-opinionated simplified Find command made with Rust"
arch=("i686" "x86_64")
url="https://github.com/LyonSyonII/hunt-rs"
license=("custom:MIT")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('0afdd5b32db2b21a81688e2d5b40ebcf8c76b9549e83325975534cd3074c44eb')

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
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
