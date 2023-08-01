# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="cargo-all-features"
pkgname="cargo-all-features"
pkgver=1.10.0
pkgrel=1
pkgdesc='A Cargo subcommand to build and test all feature flag combinations'
url='https://crates.io/crates/cargo-all-features'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-all-features/1.10.0/download")
sha512sums=('56b032ec8334416d3a7358a990a81a79f57999cc45c3e29ade5dc078a3bc8bf19bf0fa8686712cfc95c25bf0faca4b138b1a8f449c8b82fd0d2e6f2402eb4727')

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
	install -Dm755 "target/release/cargo-build-all-features" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-test-all-features" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-check-all-features" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE-APACHE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/$pkgname/"
}