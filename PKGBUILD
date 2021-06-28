# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=barchart
pkgver=0.1.0
pkgrel=1
pkgdesc="Print a bar chart from the command line"
arch=("x86_64")
url="https://github.com/jez/barchart"
license=("MIT")
makedepends=("cargo")
source=(
    "https://github.com/jez/barchart/archive/refs/tags/${pkgver}.tar.gz"
    # TODO: remove this once issue #2 has been resolved
    # https://github.com/jez/barchart/issues/2
    "https://jez.io/MIT-LICENSE.txt"
)
sha512sums=(
    "f512aeb3e89d48f57bf1b531bc4237c4212f688648eb4f52b10560dcc36cbad58aebaddb1d3e5fe86818f870af209dbdc50c37dadd61250509bc7a77be3dcd05"
    "c64cc972f555b9a349c87c55e6b87601bd11415a3e2fb8356a1aa93c5688e0186627036b27e396361281c6ff4a58481d7690b5704f41593a091ab364aa936b43"
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
    install -Dm644 "${srcdir}/MIT-LICENSE.txt" "${pkgdir}/usr/share/licenses/barchart/LICENSE.txt"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/barchart/README.md"
}
