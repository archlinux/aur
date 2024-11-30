pkgname=hunt
pkgver=3.0.0
pkgrel=1
pkgdesc='Highly-opinionated simplified Find command made with Rust'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/LyonSyonII/$pkgname-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('0e9e44c81fe0eeff25cf856a21966e2dd028ff93ff4d5494ffb18fe2552b0fc365d38e2bac410a29fda3f25074b2a6657e6748bc362c6e27774b6a35168ff33b')
b2sums=('993ef81ef87c7815b7eb099f413530104aabeba0fb0b1efa5f5e97d622bae5663967bbbd49c619e15e02cd4b001980213538a4a771037e28d22f203d937127e3')

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
