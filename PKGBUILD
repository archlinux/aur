# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=chopper
pkgver=0.6.0
pkgrel=1
pkgdesc='Rust implementation of NanoFilt+NanoLyse intended for long read sequencing'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('git' 'rust' 'cmake')
url='https://github.com/wdecoster/chopper'
license=('MIT')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/chopper/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('3235fb5334cc8f6a18c9e0cfe3054fd96730e3601043b1044bd07269be0f9ce2fcf8b09d60f86e06911af991f640762d7a9445db2d11be2ce4580abf725457c7')

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

