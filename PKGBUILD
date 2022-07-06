# Maintainer: jzbor <jzbor at posteo dot net>
pkgname=raw-to-img
pkgver=0.2.2
pkgrel=1
pkgdesc="Convert raw files to regular image files"
arch=('x86_64')
url="https://github.com/jzbor/raw-to-img"
license=('custom')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c2ff56e75d36ef9218783d06b54d435da32c86bd0aa8979c75500310b6302a8547240141cf2a935cf6cd23e8918336b687ab712a94f782ba6e86568796a5170f')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
