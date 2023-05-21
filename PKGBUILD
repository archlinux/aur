# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx
pkgver=1.30.3
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
makedepends=('cargo')
provides=('rtx')
conflicts=('rtx-bin')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('6ae5c8389d4e03d4e207b0ef97833f0792351ee5856394c1e761e91afc7dc1a01bf25b821a2025903495a4ad1ad8f2b1a50c3e5c14d0dc83eabb90a28eff850d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    ./target/release/rtx --version
}
