# Maintainer: Shirow MIURA <shirowmiura at gmail dot com>

pkgname=deltacp
pkgver=0.1.0
pkgrel=2
pkgdesc="A copy tool designed for incremental and differential backups of block devices or large files by utilizing reflink (CoW)"
url="https://codeberg.org/sharow/deltacp"
license=('MIT')
depends=('xxhash')
makedepends=('scdoc')
arch=('x86_64')
optdepends=(
    'python: for a inspectextents script that provides shared-extent analysis'
)
options=(zipman !debug)
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/sharow/deltacp/archive/v0.1.0.tar.gz")
sha256sums=('a42cfa92b9163c8c0d17343ba54a54af7c9202e50b94a6a3faae1aa6cb1b6cba')


build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 deltacp -t "${pkgdir}/usr/bin/"
    install -Dm755 inspectextents -t "${pkgdir}/usr/bin/"
    install -Dm644 deltacp.1 -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
