# Maintainer: Sven Rademakers <sven@turingpi.com>
pkgname=tpi-git
pkgver=1.0.7
pkgdesc='Official Turing-Pi2 CLI tool'
source=("git+https://github.com/turing-machines/tpi.git")
pkgrel=3
url=https://turingpi.com/
license=('Apache-2.0')
makedepends=('cargo' 'git')
arch=('x86_64' 'aarch64' 'armv7h')
options=(!lto)

prepare() {
    cd tpi
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd tpi
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd tpi
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}
package() {
    TARGET=$CARCH-unknown-linux-gnu
mkdir -p ${pkgdir}/usr/bin
mkdir -p ${pkgdir}/usr/share/doc/tpi
install -m 755 ${srcdir}/tpi/target/${TARGET}/release/tpi ${pkgdir}/usr/bin/tpi
install -m 644 ${srcdir}/tpi/README.md ${pkgdir}/usr/share/doc/tpi/README.md
install -m 644 ${srcdir}/tpi/LICENSE ${pkgdir}/usr/share/doc/tpi/copyright
}

sha256sums=('SKIP')
sha256sums=('SKIP')
