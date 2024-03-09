# Maintainer: G1ya777
pkgname=rename-gru-git
pkgver=0.8.2
pkgrel=1
pkgdesc="A CLI tool to batch rename files in the provided directory"
url="https://github.com/G1ya777/GRU"
license=("MIT")
arch=("any")
depends=()
makedepends=('rust' 'git')
provides=("rename-gru")
conflicts=()
source=("git+$url")
sha256sums=('SKIP')


prepare() {
	cd "GRU"
	cargo fetch --target "$CARCH-unknown-linux-gnu"	
}

build() {
	cd "GRU"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-targets	
}

package() {
	cd "GRU"
    install -Dm755 target/release/rename-gru -t "$pkgdir/usr/bin"
}
