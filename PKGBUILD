# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools
pkgver=0.10.7
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
makedepends=('cargo')
source=(https://github.com/g-plane/wasm-language-tools/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('9bddd6407bac2cc6ba57f3a0f8d57b86731bc32d2a930f2badbff9d0f3abd438d76360c24bd65ca3118913aa2a9fbbb44475c9021feb4b59fe6b5d645e506587')

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
