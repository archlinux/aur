# Maintainer: John Moon <john@jmoon.dev>
pkgname=mozwire
_pkgname_caps=MozWire
pkgver=0.7.0
pkgrel=1
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('67c11037c6ae2f8e9153678a9c390d57e2abf724081ed7b8a461eb0905b7346a614e4cace2c5a08f54c9e953ea6ff71f1a57f0a1330d5536f5750b0c0a57dcc1')
b2sums=('6a6f1a7cafd04bf382efa4ef4208768ecb98d24f670090e72b78e61152b67d1f7029d4fbc8c429f26970d56fa6fea689af90027063a8fc7a8cdd7928ce9ba97b')

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
