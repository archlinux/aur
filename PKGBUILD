# Maintainer: Nils André <nils@nilsand.re>
# Maintainer: John Moon <john@jmoon.dev>
pkgname=mozwire
_pkgname_caps=MozWire
pkgver=0.8.1
pkgrel=1
pkgdesc='A cross-platform client for MozillaVPN'
url='https://github.com/NilsIrl/MozWire'
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('6d761f430795b7ea6f8e3f8aefbd7f5abbd6e1a0fef0e5cd5d26e378d7f894d7fb19e531b5ce7115d6cc6cfaa814e4cb9fba5e3f3af3dc115bac9d96207831d4')
b2sums=('0b6fc2f8d78dc4728cc6c372c9f6b349e9c18e6375ca8a78acba8cb787d20688259122903fc7003f70a288658c4d2d0dc22a66ceb9f6f1261d8cfef52d351d44')

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
