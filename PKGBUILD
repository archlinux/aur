# Maintainer: John Moon <john@jmoon.dev>
pkgname=mozwire
_pkgname_caps=MozWire
pkgver=0.4.1
pkgrel=1
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('e747a5cc4764f4be557f055f91dec93003f28b48403cf4d0fd5ddd1b423009ea9fe408bf656d851b7053d07dda130184e7368c1c280aed36ea04f1abe28f0885')
b2sums=('8caf7d811d6eb39efbf5ffa6f8fb2704473cde6e1f7623bd508c0dbf25d4ce9b425bcc0e515dcb695f90ec48ba31b09ed51e712758b3b33f5b817606737c2cfe')

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
