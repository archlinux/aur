# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="faketty"
pkgname="faketty"
pkgver=1.0.11
pkgrel=1
pkgdesc='Wrapper to exec a command in a pty, even if redirecting the output'
url='https://crates.io/crates/faketty'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/faketty/1.0.11/download")
sha512sums=('2f5ff623488ce88d504a71eebe4f911277f6ed2fb79c447988d13fbc682f8517b7610f9eb462e9224d12170ed9ff6ce3e18faae5ff08494370394e4eee020d5f')

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
	install -Dm755 "target/release/faketty" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}