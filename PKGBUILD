# Maintainer: Noah Price <nprice@pricemail.ca>
pkgname=md-to-svg
pkgver=0.2.1
pkgrel=1
pkgdesc="Highly configurable CLI tool to translate Markdown Documents into SVG files"
arch=('x86_64')
url="https://github.com/noahprice-dev/md-to-svg"
license=('BSD-3-Clause')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/noahprice-dev/md-to-svg/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('569e1615889a758a5db404372af33ba99be9736f578d11378763f3faa7774470')

prepare() {
    cd "md-to-svg-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "md-to-svg-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "md-to-svg-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "md-to-svg-$pkgver"
    install -Dm755 "target/release/md_to_svg" "$pkgdir/usr/bin/md-to-svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
