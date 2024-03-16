pkgname=hunt
pkgver=2.3.0
pkgrel=1
pkgdesc='Highly-opinionated simplified Find command made with Rust'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/LyonSyonII/$pkgname-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('214a73b80c33040b5fe5df94330aad88ac9a160a921069895bae5ceb07bea0b38c26a753e2ce76bd2b65ecc7c988886fc6a4f44b0fa8b3b36f97fb6279769a36')
b2sums=('946ed6eb727c25d1bc9bdcadbca8252a35b210461d790983a2ef0e88bbfbc6087b8d4e39afc5424404d998a280d6d44c9ec6b54c84baba463f5d98f995fc2855')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features || cargo build --release
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
