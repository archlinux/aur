pkgname=hunt
pkgver=2.4.0
pkgrel=1
pkgdesc='Highly-opinionated simplified Find command made with Rust'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/LyonSyonII/$pkgname-rs"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('822e369982be71c2922f713e03cb7db208504294f2361e1ad05b2a525a68788ac1d7b329bbc4a0fa70fdac9e3623220c3c84d5caaeae9b8648fe607c6186e9ef')
b2sums=('4a4ba3b43adbf929cbacc14f5430da4d49f2f511fa8e33318fa92d826db730ee6a6e8bd785ca178c6c7e62e2348cb6b649c8e42fad2ebc1d17793753f3d3f4e1')

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
