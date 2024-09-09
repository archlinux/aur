# Maintainer: Noa Himesaka <himesaka AT noa DOT codes>
pkgname=roon-tui
pkgver=0.3.2
pkgrel=1
pkgdesc="A Roon Remote for the terminal"
url="https://github.com/TheAppgineer/roon-tui"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'cargo')
source=("git+https://github.com/TheAppgineer/roon-tui.git#tag=$pkgver")
sha256sums=('6cb5fec18ba92bac53abadfec909ce4e53f5fd7b352018f69d0a45ba24b6c81a')

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
	# Install binary
	install -Dm755 "$pkgname/target/release/roon-tui" "$pkgdir/usr/bin/roon-tui"
}
