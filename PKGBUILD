# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=motd
pkgver=1.3.2
pkgrel=1
pkgdesc='Dynamically generate system information for MOTD SSH banner'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('hddtemp: to probe hard drive temperatures'
            'systemd: to display failed units')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('47b004cd5b11fcccea251ea76d16af022edfaa4a94ad832ddecafd43484acb3e4cae983ee4793c9beb2897758676e3af1b75f343b6942ecbf6a2a815e697eac3')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
