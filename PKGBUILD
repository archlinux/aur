# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=biodiff
pkgver=0.2.1
pkgrel=1
pkgdesc="Hex diff viewer using alignment algorithms from biology"
arch=('x86_64')
url="https://github.com/8051Enthusiast/biodiff"
license=('MIT')
makedepends=(cargo-nightly)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('3465622163689a92fb054d8f5858d5c5e4b80d0eb25810e28403f8c0cdf6f169a9fb28853793233d3460cd5ad1dfc40819f0110ac882f5bc0a8899ce7aff0f93')

prepare() {
    cd "$pkgname-$pkgver"
    cargo +nightly fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo +nightly build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
