# Maintainer: John Moon <john@jmoon.dev>
pkgname=mozwire
_pkgname_caps=MozWire
pkgver=0.5.1
pkgrel=1
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('ccaafec43beee77195f537a40fea4e745dd621737bac1eca93590d8e4f10879bfd686a7facae38587e8bc4f491c9415101a86025c62d2db6e0e1caa6cee63789')
b2sums=('543968c0d742abc9f3135ab3c90f25bdbdd2631d2afb01aa0b9b27a6f94b31bb631bc27d0cae4d0eae1e2d93ef96c347a0a2911de6f3293215e68301fc80bd7a')

prepare() {
    cd "${_pkgname_caps}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname_caps}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
}

check() {
    cd "${_pkgname_caps}-${pkgver}"
    cargo test --release --locked --target-dir=target
}

package() {
    cd "${_pkgname_caps}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

