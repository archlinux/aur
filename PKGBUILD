# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=alevin-fry
pkgver=0.10.0
pkgrel=1
pkgdesc='A suite of tools for the rapid, accurate and memory-frugal processing single-cell and single-nucleus sequencing data'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake')
url='https://alevin-fry.readthedocs.io/en/latest/'
license=('BSD-3-Clause')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/COMBINE-lab/alevin-fry/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('6c6becd07f63794d63fdf7c40f56289f01de093c403db3b593f72312cb2617bc')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch  --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  
}
