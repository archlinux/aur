# Maintainer: Shirow MIURA <shirowmiura at gmail dot com>

pkgname=deltacp
pkgver=0.2.4
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
sha256sums=('a0bb394f8f061a4e44770f0d9f151e5e257d067280c6ff57fea26eeaa2d63a49')

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
