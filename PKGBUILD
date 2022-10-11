# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp
pkgver=0.1.1
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
sha256sums=('67fe2c2e04eda814a29fe70a519da1c65b9567697ee6d28b7a5d168f91407f9b')

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
