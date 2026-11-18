# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools
pkgver=0.12.0
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
makedepends=('cargo')
source=(https://github.com/g-plane/wasm-language-tools/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('26fa80e30cd935cfddc2df2aeb323654d38eea8c3b9fea816a05f49bf33afb5b5d29e8e8046482f8bf875ec7b4c7dd29a6214736499f30317568e9ee26f5c89d')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/target/release/wat_server" "${pkgdir}/usr/bin/wat_server"
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
