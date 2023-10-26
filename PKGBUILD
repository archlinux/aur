# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
_name=bloxberg
pkgname=$_name-git
pkgver=r32.4d3e6e1
pkgrel=1
pkgdesc='An experimental TUI-based hex editor written in Rust'
arch=(x86_64)
url='https://github.com/voidc/bloxberg'
license=('MIT')
makedepends=('cargo' 'git')
provides=("$_name")
conflicts=("$_name")
source=('git+https://github.com/voidc/bloxberg.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_name"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_name"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_name"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_name"
}
