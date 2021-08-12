# Maintainer: Devin Singh <drsingh2518 [at] icloud [dot] com>
pkgname=paper-wl
pkgver=0.1.0
pkgrel=1
pkgdesc='Serifed Iosevka build'
arch=('any')
url='https://gitlab.com/snakedye/paper'
license=('MIT')
makedepends=('git' 'cargo')
source=("git+https://gitlab.com/snakedye/paper.git")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}/paper
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${srcdir}/paper
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd ${srcdir}/paper
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${srcdir}/paper
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/paper"
}
