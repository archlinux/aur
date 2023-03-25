# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="cargo-all-features"
pkgname="cargo-all-features"
pkgver=1.9.0
pkgrel=1
pkgdesc='A Cargo subcommand to build and test all feature flag combinations'
url='https://crates.io/crates/cargo-all-features'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-all-features/1.9.0/download")
sha512sums=('b246b50917f52fd37d8358f748a3a80bb1678201da747f757a42ce18715b02deddf5749eb62f14113826df552d1b2543dace70595aa40c9f09c284bf66abd573')

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