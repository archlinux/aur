# Maintainer: John Moon <john@jmoon.dev>
pkgname=mozwire
_pkgname_caps=MozWire
pkgver=0.5.2
pkgrel=1
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('36f119e367c6b641f091a9fab8597d2c1bda6c6a977964c7f3a781a4ff0343507b80a782828066d7bd3553473419d9452dea5ad8fe137ee95b4ec3f0227c1390')
b2sums=('d7bdf0b9c1d59f416d2e07f387304709f6868ae115e46f4ef2e8b1dad9ddb7bf68fbbf8d0da8bb250eb939a563c9a272805ce9964dfe532aa4bb7575387ab5eb')

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
