# Maintainer: jzbor <jzbor at posteo dot net>
pkgname=raw-to-img
pkgver=0.1.0
pkgrel=1
pkgdesc="Convert raw files to regular image files"
arch=('x86_64')
url="https://github.com/jzbor/raw-to-img"
license=('custom')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dbd7d4b7e112a9cb674b4e15ba6d57dc874ec6c79c20f7c199d3ab6ca7e8fef44a1835f89862b96c748047abe8374e94aef1423dab917befedb3d6a002c0d229')

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
