# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop
pkgver=1.2.1
pkgrel=1
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('63bd333cc9971914111958d2cff2e36ae5ff470008d16ebfd42e6a1d3fe57b14e90787f89a36b3f9023036c2327aa45f3c111c7c565018a9e410348232cfdc58')

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
