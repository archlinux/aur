# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools
pkgver=0.7.0
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
makedepends=('cargo')
source=(https://github.com/g-plane/wasm-language-tools/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('cf9fb4f9be2a97aee5abfdea2e47cf6a98a378f318ddcd7aa9489b76493234cf46bdc502837dd9337d2b0223538e34b91a30ee89949903fed50a39fe438f88b4')

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
