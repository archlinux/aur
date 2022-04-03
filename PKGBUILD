# Maintainer: Max1Truc <max1truc @ disroot dot org>
_pkgname="magic-wormhole.rs"
pkgname="wormhole-rs"
pkgver="0.4.0"
pkgrel="3"
pkgdesc="Rust implementation of Magic Wormhole, with new features and enhancements"
arch=('x86_64')
url="https://github.com/magic-wormhole/$_pkgname"
license=('EUPL-1.2+')
depends=('libxcb')
makedepends=('cargo')
# optdepends=('bash-completion: Bash completion')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('25a20904fd222479988ceef8ce51aa850291ee9c9047de7a26017b53bede9c3636acc6d7e5c66bdc01f379adbc2a95e3b05e50d5903be68a3d8506183cf1af8c')

_sourcedirectory="$_pkgname-$pkgver"

prepare() {
	cd "$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
