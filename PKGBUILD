# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=cpc-calc
pkgver=1.8.0
pkgrel=3
pkgdesc="Text calculator with support for units and conversion"
arch=("x86_64")
url="https://github.com/probablykasper/cpc"
license=("MIT")
makedepends=("cargo")
source=(
    "https://github.com/probablykasper/cpc/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
    "218ac7d1bebeb3caf21293312bbca9e59283b455285463faa63d4812f7d86cbdd1853ea8efefbbb5b6ce08dd1c0a83684355cb17707846310fd126f339823222"
)

prepare() {
    cargo fetch --locked --manifest-path "cpc-${pkgver}/Cargo.toml"
}

check() {
    cd "cpc-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "cpc-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --locked --offline --all-features --root "${pkgdir}/usr/" --path .
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cpc-calc/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/cpc-calc/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/cpc-calc/CHANGELOG.md"
}
