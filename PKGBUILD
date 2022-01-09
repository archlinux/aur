# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.2.0
pkgrel=3
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('aarch64' 'x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
depends=('gcc-libs'
         'openssl')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('544430d718de0fa27b01282139d90dd4f1da6c81e6d2a5af47b079be763dd0567cf6833ed388c5e0f62aad2546cc1d78760f9c256de750e74c8e70939f170f53')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
