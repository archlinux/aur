# Maintainer: James Triantafylos <JTriantafylos at protonmail dot com>
_reponame=BitTwiddle
pkgname=bittwiddle
pkgver=0.1.0
pkgrel=1
pkgdesc="A small terminal programmer calculator."
arch=('x86_64')
url="https://github.com/JTriantafylos/${_reponame}"
license=('BSD-2-Clause')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JTriantafylos/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('5e156f1540588b7047fb6d07f5f2633adb90d0b7f5543b42d1e2c60a5e5b2709')

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
