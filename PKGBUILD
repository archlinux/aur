# Maintainer: desbma
pkgname=motd
pkgver=1.0.7
pkgrel=1
pkgdesc='Dynamically generate system information for MOTD SSH banner'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('GPL')
makedepends=('rust')
optdepends=('hddtemp: to probe hard drive temperatures'
            'systemd: to display failed units')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9ef7fbbe0d21f231719960ef3f05914674878812d263058b46d09d769fc74ff4cd7afe9252bc9625965c13f8605a215492f68ced3ed9f42754782637e50c2f9c')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
}
