# Maintainer: Sven Rademakers <sven@turingpi.com>:Ruslan Akbashev <ra@turingpi.com>

pkgname=tpi
pkgver=1.0.2
pkgrel=1
pkgdesc='CLI tool to control a Turing-Pi board'
url=https://turingpi.com/
license=('Apache')
makedepends=('cargo')
arch=('any')
source=('https://github.com/turing-machines/tpi/archive/refs/tags/v1.0.2.tar.gz')
prepare() {
    cd $srcdir/tpi-1.0.2
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/tpi-1.0.2 && cargo build --frozen --release 
}
check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/tpi-1.0.2 && cargo test --frozen 
}
package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/tpi-1.0.2/target/release/tpi"
}
