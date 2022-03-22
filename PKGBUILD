# Maintainer: Max1Truc <max1truc @ disroot dot org>
_pkgname="magic-wormhole.rs"
pkgname="wormhole-rs"
pkgver="0.3.1"
pkgrel="1"
pkgdesc="Rust implementation of Magic Wormhole, with new features and enhancements"
arch=('x86_64')
url="https://github.com/magic-wormhole/$_pkgname"
license=('EUPL-1.2+')
# depends=('fuse2')
makedepends=('cargo')
# optdepends=('bash-completion: Bash completion')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('57e798b53b3e4249d29f0cd60cd00d113bffb3ee7ade45ce8a2f6763c29bcd37e1567df05cf849077744736b7e59a37aa645ea5671ae196fea35c048baa7f631')

_sourcedirectory="$_pkgname-$pkgver"

prepare() {
	cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
	cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

build() {
	cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EUPL-1.2" LICENSE
}
