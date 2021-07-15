# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=cpc-calc
pkgver=1.7.0
pkgrel=1
pkgdesc="Text calculator with support for units and conversion"
arch=("x86_64")
url="https://github.com/probablykasper/cpc"
license=("MIT")
makedepends=("cargo")
source=(
    "https://github.com/probablykasper/cpc/archive/refs/tags/v${pkgver}.tar.gz"
)
sha512sums=(
    "864cbcfb60f80163e000f056b100ff5ffd59d9b5e0d7b3111817590fe47ede969af16a03705b27316c74d9504d03caa82bc0c1964705f75332400337d5474e0c"
)

build() {
    cd "cpc-${pkgver}"

    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "cpc-${pkgver}"

    RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
    cd "cpc-${pkgver}"

    install -Dm755 target/release/cpc "${pkgdir}/usr/bin/cpc"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cpc-calc/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/cpc-calc/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/cpc-calc/CHANGELOG.md"
}
