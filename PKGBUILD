# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-diet"
pkgname="cargo-diet"
pkgver=1.2.4
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo m...'
url='https://crates.io/crates/cargo-diet'
license=('MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-diet/1.2.4/download")
sha512sums=('65dc66be3c11e75d08152ccc8b8a44902ad986b3e6acc2cc3980d78c25898e5c22cf9d91b12bbde4063e1cc4aa0937b2c3009c3f8a1fac94d2f187cfc879fdd9')

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