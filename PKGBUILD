# Maintainer: jzbor <jzbor at posteo dot net>
pkgname=raw-to-img
pkgver=0.2.3
pkgrel=1
pkgdesc="Convert raw files to regular image files"
arch=('x86_64')
url="https://github.com/jzbor/raw-to-img"
license=('custom')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('51397be144fd71f955105aa0fbb6d3baf394020b2d0d416952fbccfca248b89379a09a0710eccbe9022ac44f3e672e9c80c6d44a82fe7064db2f2a368e962761')

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
