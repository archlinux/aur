# Maintainer: Sven Rademakers <sven@turingpi.com>

pkgname=tpi
pkgver=0.2.0
pkgrel=1
pkgdesc='CLI tool to control a Turing-Pi board'
url=https://turingpi.com/
license=('Apache')
makedepends=('cargo')
arch=('any')
source=('https://github.com/turing-machines/tpi/archive/refs/tags/v0.2.0.tar.gz')
prepare() {
    cd $srcdir/tpi-0.2.0
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/tpi-0.2.0 && cargo build --frozen --release --all-features
}
check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/tpi-0.2.0 && cargo test --frozen --all-features
}
package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/tpi-0.2.0/target/release/tpi"
}
md5sums=('c000c8f94f9e62b95df3cfedd3bb10ba')
