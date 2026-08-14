# Maintainer: Shirow MIURA <shirowmiura at gmail dot com>

pkgname=deltacp
pkgver=0.2.3
pkgrel=1
pkgdesc="A copy tool designed for incremental backup of block devices by utilizing reflink (CoW)"
url="https://codeberg.org/sharow/deltacp"
license=('MIT')
depends=('xxhash')
makedepends=('scdoc')
arch=('x86_64')
optdepends=(
    'python: for a inspectextents script that provides shared-extent analysis'
    'thin-provisioning-tools: CBT support (dm-era and thin-provisioning)'
)
options=(zipman !debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a7f65efe1125dfd545fead925defc6f6ee08ab4500d0877e78dd8625fce758c4')

build() {
    cd "${srcdir}/${pkgname}"
    make all
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 deltacp        -t "${pkgdir}/usr/bin/"
    install -Dm755 inspectextents -t "${pkgdir}/usr/bin/"
    install -Dm644 deltacp.1      -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 LICENSE        -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
