# Maintainer: James Triantafylos <JTriantafylos at protonmail dot com>
_reponame=BitTwiddle
pkgname=bittwiddle
pkgver=0.2.0
pkgrel=1
pkgdesc="A small terminal programmer calculator."
arch=('x86_64')
url="https://github.com/JTriantafylos/${_reponame}"
license=('BSD-2-Clause')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JTriantafylos/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('2aab0f096a0f9bfee425d3cb0617856ec8d0684c051b4a4a793bd5b5ef72ee26')

prepare() {
    cd "${_reponame}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_reponame}-${pkgver}"

    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package () {
    cd "${_reponame}-${pkgver}"

    install -Dm755 "target/release/bittwiddle" "${pkgdir}/usr/bin/bittwiddle"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
