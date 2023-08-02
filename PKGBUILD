# Maintainer: Sven Rademakers <sven.rademakers@gmail.com>

pkgname=tpi-git
pkgver=0.1.0
pkgrel=1
pkgdesc='CLI tool to control a Turing-Pi board'
url=https://turingpi.com/
license=('Apache')
makedepends=('cargo')
arch=('any')
source=('https://github.com/turing-machines/tpi/archive/refs/tags/0.1.0.tar.gz')
prepare() {
    cd $srcdir/tpi-0.1.0
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/tpi-0.1.0 && cargo build --frozen --release --all-features
}
check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/tpi-0.1.0 && cargo test --frozen --all-features
}
package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/tpi-0.1.0/target/release/tpi"
}
md5sums=('29f99878a703df18cacde1cae4a4d90a')
