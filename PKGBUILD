# Maintainer: kormpu mcgpapu@gmail.com

pkgname="tronclock"
pkgdesc="A Rust rewrite of ncurses based tronClock"
pkgver=1.0
pkgrel=1
arch=('any')
url="https://github.com/papuSpartan/tronclock"
source=("git+https://github.com/papuSpartan/tronclock.git")
license=('GPL3')
depends=()
makedepends=('cargo')
b2sums=('SKIP')

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
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
