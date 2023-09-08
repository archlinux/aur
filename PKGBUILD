#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=openai-cli-git
pkgver=r54.9b946e3
arch=("x86_64")
pkgrel=1
pkgdesc="CLI for the GPT model written in Rust"
license=("MIT")
makedepends=("rust" "git")
url="https://github.com/LevitatingBusinessMan/openai-cli"
source=("$pkgname::git+https://github.com/LevitatingBusinessMan/openai-cli")
sha256sums=("SKIP")
conflicts=("openai-cli")
provides=("openai-cli")

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 target/release/openai-cli $pkgdir/usr/bin/openai-cli
}
