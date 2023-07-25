# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-diet"
pkgname="cargo-diet"
pkgver=1.2.7
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo m...'
url='https://crates.io/crates/cargo-diet'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-diet/1.2.7/download")
sha512sums=('15fae7b330131bfdc426fa7f5a500bf40c6fe1110ebf66c9861bc4f392f8467fd52f32c2f6f6f395801efd13a26e30b78a3904c14501f0154e7fcf10c56b2b83')

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
	install -Dm755 "target/release/cargo-diet" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
}