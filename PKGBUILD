#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=openai-cli
pkgver=0.3.7
arch=("x86_64")
pkgrel=1
pkgdesc="CLI for the GPT model written in Rust"
license=("MIT")
makedepends=("cargo")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('bfa52f5006b7e76597c65e638526f045b316c3c3e7d9376f5abc09dabafc4ec5')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 target/release/$pkgname $pkgdir/usr/bin/$pkgname
}
