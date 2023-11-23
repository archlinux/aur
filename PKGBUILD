# Maintainer: Tim Dubbins <timdubbins@gmail.com>
pkgname=tap
pkgver=0.4.10
pkgrel=1
pkgdesc="An audio player for the terminal with fuzzy-finder"
arch=('x86_64')
url="https://github.com/timdubbins/tap"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timdubbins/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cc15c31ffe144eb3b0cd930610c25424acd889a4eacdc5705c4aa478b86ca3cb')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

