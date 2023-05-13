# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=treefetch
pkgver=2.0.0
pkgrel=1
pkgdesc="A plant-based system fetch tool made with Rust"
arch=("x86_64")
url="https://www.github.com/angelofallars/treefetch"
license=('GPL')
depends=("gcc-libs" "glibc")
makedepends=("rust" "cargo")
provides=("treefetch-bin" "treefetch-git")
replaces=("treefetch-bin" "treefetch-git")
changelog=
source=("git+$url.git")
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/treefetch"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/treefetch"
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$srcdir/treefetch"
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/treefetch/target/release"
	install -Dm0755 -t "$pkgdir/usr/bin" "$pkgname"
}
