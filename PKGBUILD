# Maintainer: Noa Himesaka <himesaka AT noa DOT codes>
pkgname=roon-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="A Roon Remote for the terminal"
url="https://github.com/TheAppgineer/roon-tui"
arch=('x86_64')
license=('MIT')
makedepends=('git' 'cargo')
source=("git+https://github.com/TheAppgineer/roon-tui.git#tag=$pkgver")
sha256sums=('a2e4c3224e3b067099b1ee041d73bdbcfce4ac1bd53405d95aa59ae3e889560f')

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
