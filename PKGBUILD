# Maintainer: Sven Rademakers <sven@turingpi.com>:Ruslan Akbashev <ra@turingpi.com>

pkgname=tpi
pkgver=1.0.6
pkgrel=1
pkgdesc='Official Turing-Pi2 CLI tool'
url=https://turingpi.com/
license=('Apache')
makedepends=('cargo')
arch=('any')
source=('https://github.com/turing-machines/tpi/archive/refs/tags/v1.0.6.tar.gz')
prepare() {
    cd $srcdir/tpi-1.0.6
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/tpi-1.0.6 && cargo build --frozen --release 
}
check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $srcdir/tpi-1.0.6 && cargo test --frozen 
}
package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/tpi-1.0.6/target/release/tpi"
}
md5sums=('6ab7582ee9d6cdb1992229da6f07540b')
