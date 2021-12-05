# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop
pkgver=1.1.1
pkgrel=1
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MIT')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fb2bdd30fd0d0fab3106dd717d42bc62e3f365042a4b56d747cae2d9d03a6451bd40312a34e23183349b5b96a1f2747fffc876777970c21d3959297653d6a034')

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
