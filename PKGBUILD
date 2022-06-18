# Maintainer: kormpu mcgpapu@gmail.com

#https://wiki.archlinux.org/title/Rust_package_guidelines
pkgname="tronclock"
pkgdesc="A Rust rewrite of ncurses based tronClock"
pkgver=1.0
pkgrel=3
arch=('any')
url="https://github.com/papuSpartan/tronclock"
source=("git+https://github.com/papuSpartan/tronclock.git")
license=('GPL3')
depends=()
makedepends=('cargo')
b2sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
