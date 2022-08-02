# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="ellipse-bin"
pkgname="ellipse"
pkgver=1.0.0
pkgrel=1
pkgdesc='Command that truncates and ellipses strings in a human-friendly way'
url='https://crates.io/crates/ellipse-bin'
license=('GPL-3.0')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/ellipse-bin/1.0.0/download")
sha512sums=('40b4700f87680cf81b0238ba63e95068877c96d36ffcaac62d361989bb351a10562941800f0b8f7adb66477a7eebd02322f359e3f52fb6e86fd48befe1ed9b69')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/ellipse" -t "$pkgdir/usr/bin"
}