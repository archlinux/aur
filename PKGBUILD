# Maintainer: taotieren <admin@taotieren.com>

pkgname=wchisp
pkgver=0.2.0
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
sha256sums=('37830a63b754adf2fb90ca18e0bc38410a9fa372de024744af9e573f08b817a1')

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
