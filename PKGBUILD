# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop
pkgver=1.2.0
pkgrel=2
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('cf5b7d16e0216577fd06aceed30dec8241df5e50496bd59f4ddeb72bd33aaf1eb8f72e192eb88d6baa7647f0692f89473cee3c0a7434bbf839ade61c1a544d9f')

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
    ln -rs "${pkgdir}"/usr/bin/rs{op,p}
    ln -rs "${pkgdir}"/usr/bin/rs{op,o}
    ln -rs "${pkgdir}"/usr/bin/rs{op,i}
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
