# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools
pkgver=0.6.1
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
makedepends=('cargo')
source=(https://github.com/g-plane/wasm-language-tools/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('adfdcba439e9e6da9460860bd598b471ab877925addf5e8c1455bd5ac9c0e94159065d6e632be37a8049f5c6964ee38c607751e5bdae1670c276d8e689d1b2d7')

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
