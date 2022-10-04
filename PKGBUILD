# Maintainer: Arthur Carcano <arthur.carcano@ocamlpro.com>
pkgname=agnos
pkgver=0.1.0_beta.1
pkgrel=1
makedepends=('rust' 'cargo')
depends=('openssl')
arch=('x86_64')
pkgdesc="Obtain (wildcard) certificates from let\'s encrypt using dns-01 without the need for API access to your DNS provider."
license=('MIT')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-${pkgver//_/-}.crate")
sha256sums=('242ecf449550a6dcc6e6b7f75a5a9cc205a448adfc5fe71387163bae32c90d21')
install="INSTALL"

prepare() {
    mv $pkgname-${pkgver//_/-}/* ./
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
