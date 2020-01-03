# Maintainer: desbma
pkgname=motd
pkgver=1.0.4
pkgrel=1
pkgdesc='Dynamically generate system information for MOTD SSH banner'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
optdepends=('hddtemp: to probe hard drive temperatures'
            'systemd: to display failed units')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('57447c63a6ca46b7d2313e281638d86b90245f1d5c17b61ae810de733e52e195e43cd5619bbf29c74d1f115f9dc09de866c4d6048591340221d05712a28a8947')

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
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/motd
}
