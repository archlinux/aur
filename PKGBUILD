#Maintainer: Rein Fernhout (LevitatingBusinessMan) <me@levitati.ng>

pkgname=openai-cli-git
pkgver=r27.e66bf5d
arch=("x86_64")
pkgrel=1
pkgdesc="CLI for the GPT model"
license=("MIT")
makedepends=("rust" "git")
url="https://github.com/LevitatingBusinessMan/openai-cli"
source=("git+https://github.com/LevitatingBusinessMan/openai-cli")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/openai-cli"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/openai-cli"
    export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/openai-cli"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target1
	cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/openai-cli"
	install -Dm755 target/release/openai-cli $pkgdir/usr/bin/openai-cli
}
