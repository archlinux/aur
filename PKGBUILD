# Maintainer: Ashton Bennet <ashtonquinn@disroot.org>
pkgname=humnumsort
pkgver=0.1.1
pkgrel=1
pkgdesc='A more human-friendly alternative to GNU Sort, written in Rust'
depends=('rust')
provides=('humnumsort')
makedepends=('rust' 'cargo')
arch=('x86_64' 'armv6h' 'armv7h')
license=('Apache-2.0')
url='https://github.com/ctrlcctrlv/humnumsort'

pkgver() {
	cd "$srcdir/humnumsort/bin"
	awk -F\" '/^version/ { print $2; exit }' Cargo.toml
}

prepare() {
	cd "$srcdir/humnumsort/bin"
	# Upstream lockfile is buggered in v0.1.1
	cargo update
}

build() {
	cd "$srcdir/humnumsort/bin"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

check() {
	cd "$srcdir/humnumsort/bin"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "$srcdir/humnumsort/bin/"
	sudo cp target/release/hns /usr/bin/hns
	sudo ln -s /usr/bin/hns /usr/bin/hns+
}

