# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="cargo-all-features"
pkgname="cargo-all-features"
pkgver=1.8.0
pkgrel=1
pkgdesc='A Cargo subcommand to build and test all feature flag combinations'
url='https://crates.io/crates/cargo-all-features'
license=('Apache' 'MIT')

depends=('gcc-libs' 'cargo')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-all-features/1.8.0/download")
sha512sums=('beadbb2bff06cf3815bbe9e9eca9029c3ba20a56d247558e6573776b0235bc11410756a1dba29e1a46ad2edced7cfff14d9bc18dd64008ca113a053efa9f7330')

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