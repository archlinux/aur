# Maintainer: jzbor <jzbor at posteo dot net>
pkgname=raw-to-img
pkgver=0.2.1
pkgrel=1
pkgdesc="Convert raw files to regular image files"
arch=('x86_64')
url="https://github.com/jzbor/raw-to-img"
license=('custom')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a00e89efb94a8322ce0969d3e247b54fdb7bf9fa2dffd26463ef30adb8d44964c3d7bae51f40137d6c9067c4957ba79e963a41e4b14775787765a1b3df5aed3c')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --offline --target "$CARCH-unknown-linux-gnu"
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
