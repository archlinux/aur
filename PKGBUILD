# Maintainer: desbma
pkgname=zoxide
pkgver=0.1.1
pkgrel=1
pkgdesc='A fast cd command that learns your habits'
arch=('x86_64')
url="https://github.com/ajeetdsouza/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ajeetdsouza/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('9e9372b395e774cba4750df291205299faffba6a805729dda518f12a6176f4c1ea3521aa6481ba3e8f8985088d48d2fe16f30836fdb9a6d0d8a49b32b00e2e4b')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    install -Dm 644 zoxide.plugin.zsh "${pkgdir}/usr/share/${pkgname}/${pkgname}.zsh"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
