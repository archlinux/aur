# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
pkgname="cargo-doc2readme"
pkgver=0.2.2
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-doc2readme/0.2.2/download")
sha512sums=('dbab78b7de28939ef4fd880ec3753001aaec0eec5c264e6e5375ebd4024b0ca86a8d2460257988022b58fb1ba71a514e2bebbbc4e8cbae93da32de9581a15493')

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
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}