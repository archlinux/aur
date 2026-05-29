# Maintainer: wuxxin <wuxxin@gmail.com>

pkgname=coreos-installer
pkgver=0.26.0
pkgrel=1
pkgdesc="Installer for CoreOS disk images"
url="https://github.com/coreos/coreos-installer"
depends=('cargo')
arch=('x86_64')
license=('APACHE')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/coreos/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('793c7e2a1021be6824b62392cc7dea267161767ffed078561c7d8a2e61f817cc')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
