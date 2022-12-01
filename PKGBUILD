# Maintainer: jzbor <jzbor at posteo dot net>
pkgname=raw-to-img
pkgver=0.3.0
pkgrel=1
pkgdesc="Convert raw files to regular image files"
arch=('x86_64')
url="https://github.com/jzbor/raw-to-img"
license=('custom')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('1e434b2a557f2231429b37b9e4b0d993ab920a11980100ce582a2b9b33b8a171bcd87cdbf8068b8edffff38e2ee1e3013f4f4ed776875ae79052e4a15b17f6f3')

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
