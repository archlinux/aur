# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=barchart
pkgver=0.2.0
pkgrel=1
pkgdesc="Print a bar chart from the command line"
arch=("x86_64")
url="https://github.com/jez/barchart"
license=("MIT")
makedepends=("cargo")
source=(
    "https://github.com/jez/barchart/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=(
    "5b662b95a4acf4c9e7cff695cb32b91d0f4a306c11f7d11ac177cbd5c9de0b3826f1754863319f13bc206f7e8d6ad1d566939a6002feb4588f6f95dc8538c350"
)

build() {
    cd "barchart-${pkgver}"

    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "barchart-${pkgver}"

    RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
    cd "barchart-${pkgver}"

    install -Dm755 target/release/barchart "${pkgdir}/usr/bin/barchart"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/barchart/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/barchart/README.md"
}
