# Maintainer: John Moon <john@jmoon.dev>
pkgname=mozwire
_pkgname_caps=MozWire
pkgver=0.6.0
pkgrel=1
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('cedc8d6ea7c68f4ec12e690e006b45a413049b32c8c967cbbfa1976c0c2d8213ca7bc159c69838658b8727acba9c3a549ddac2c0a4f4431234e079086c379782')
b2sums=('6ae724c76fce796c2f9e68f36691680f43f25e3638a823ddc9b4ab2c823c3dad463db00d5fd1dc136cce18855a769a4d35bbc3a72c39c11d4851177ff1994787')

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
    cargo test --release --locked --all-features --target-dir=target
}

package() {
    cd "${_pkgname_caps}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
