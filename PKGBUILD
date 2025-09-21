# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools
pkgver=0.5.1
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
makedepends=('cargo')
source=(https://github.com/g-plane/wasm-language-tools/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('e902d4d8bbe3366f8a439a9508cec4535031c95ee655e8b79749920ee4bc3fc23eadcaad59e945ec71d090bd0506c48e5f4aad9a6d358ba2c6caa89c0c4075c9')

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
