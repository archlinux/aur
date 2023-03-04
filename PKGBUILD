# Maintainer: Jeff Dickey <releases at rtx dot pub>

pkgname=rtx
pkgver=1.21.0
pkgrel=1
pkgdesc='Polyglot runtime manager'
arch=('x86_64')
url='https://github.com/jdxcode/rtx'
license=('MIT')
makedepends=('cargo')
provides=('rtx')
conflicts=('rtx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jdxcode/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('ab2185b0c6b33793b138fe48e370629b8a2908dff31def3c0992b30267aa0846ddcbcda600dce58417bc4cdb6c5e2ce2410c2e39adec97129dae80b51b4f3cf7')

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
