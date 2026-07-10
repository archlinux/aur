# Maintainer: nekoside <dev@nekoside.com>

pkgname=lazylore
pkgver=0.1.3
pkgrel=1
pkgdesc="Terminal UI for Lore, inspired by lazygit."
arch=('x86_64') # ?
url="https://github.com/Peralysis/lazylore"
license=("MIT")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Peralysis/lazylore/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2d46289a4ab3af06ce0282bd990470b21cf3a73ce33524e7583c04518f90cec1')
options=(!debug)
makedepends=(
    'cargo'
)
depends=(
    'glibc'
    'libgcc'
)

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 1
    cargo build --release --locked
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/lazylore" "${pkgdir}/usr/bin/lazylore"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
