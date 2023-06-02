#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=openai-cli
pkgver=0.2.2
arch=("x86_64")
pkgrel=1
pkgdesc="CLI for the GPT model written in Rust"
license=("MIT")
makedepends=("cargo")
url="https://github.com/LevitatingBusinessMan/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=("5e6c1d09f53d101a4a34bacbe70c24ba4c54bf01b3573887be5f86a7d2cd21a1")

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
