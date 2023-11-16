# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gotify-desktop
pkgver=1.3.2
pkgrel=3
pkgdesc='Small Gotify daemon to send messages as desktop notifications '
arch=('aarch64' 'x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL3')
depends=('gcc-libs'
         'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7d63c083128ac2f723a2f1242d4216c4cccf04423ec12b34edb40f4151373511b41a94769a08b0473e281855309bcd011b5eadc6731af0fa321a913168f54ad2')

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

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
