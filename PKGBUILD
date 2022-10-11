# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp
pkgver=0.1.2
pkgrel=1
pkgdesc="WCH ISP Tool in Rust"
arch=('any')
url="https://github.com/ch32-rs/wchisp"
license=('GPL-2.0')
provides=(${pkgname})
conflicts=(${pkgname}-git)
replaces=()
depends=('cargo')
makedepends=('git' 'rust')
backup=()
options=('!strip')
install=
source=("${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate")
sha256sums=('f847ad6dc25fb7d821468db93332d0a6d87992d4db5cac5dbf582f738fd8a2e7')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
}
