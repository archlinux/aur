# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="next-rust-release-date"
pkgname="next-rust-release-date"
pkgver=0.2.0
pkgrel=1
pkgdesc='When&#x27;&quot;&#x27;&quot;&#x27;s the next Rust release?'
url='https://crates.io/crates/next-rust-release-date'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/next-rust-release-date/0.2.0/download")
sha512sums=('1989219159382aa07b6ce43967ed70b10a045487c02bab78b4d65122b82887a1940fabfa2d285aa7350f416259e9faa080d2952b2a18d3b3db84e50bde7bdf49')

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
	install -Dm755 "target/release/next-rust-release-date" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}