# Maintainer: rotkonetworks <hq@rotko.net>
# PGP: 813CE099D6CE512BC29A15D841EE1853489958D6

pkgname=githem
pkgver=0.5.2
pkgrel=1
pkgdesc="turn git repositories into llm ready text"
arch=('x86_64')
url="https://github.com/rotkonetworks/githem"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p githem
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/githem" "$pkgdir/usr/bin/githem"
}
