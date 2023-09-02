# Maintainer: Tim Dubbins <timdubbins@gmail.com>
pkgname=tap
pkgver=0.4.3
pkgrel=3
pkgdesc="An audio player for the terminal with fuzzy-finder"
arch=('x86_64')
url="https://github.com/timdubbins/tap"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timdubbins/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f6bf648631eeaf3330d236b9d06df6688e32826dcc5bf1db684c611d401c7790')


prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
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
