# Maintainer: Max1Truc <max1truc @ disroot dot org>
_pkgname="magic-wormhole.rs"
pkgname="wormhole-rs"
pkgver="0.3.0"
pkgrel="1"
pkgdesc="Rust implementation of Magic Wormhole, with new features and enhancements"
arch=('x86_64')
url="https://github.com/magic-wormhole/$_pkgname"
license=('EUPL-1.2+')
# depends=('fuse2')
makedepends=('cargo')
# optdepends=('bash-completion: Bash completion')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('77fe34c3ec85f80cd5578b423249ee09ee579cd590c29ce5068473bf8a685f4b4d4512f3801b4b5716c0b46bd6ebf59dbef9b1918ec3ebd36846e925ae67fdfa')

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
