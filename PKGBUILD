# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=chopper
pkgver=0.9.1
pkgrel=1
pkgdesc='Rust implementation of NanoFilt+NanoLyse intended for long read sequencing'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('git' 'rust' 'cmake')
url='https://github.com/wdecoster/chopper'
license=('MIT')
options=(!lto)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/wdecoster/chopper/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('7ac39717bdb6cc3dd3cab4541f0a0d9589bff6997398a5db8dbc0aaf14b75246dc8a14ce51a7a8f798802290e74ad6285db0013e0d5283b1b4fe9d0a6c4dac60')

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

