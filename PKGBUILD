# Maintainer: Shirow MIURA <shirowmiura at gmail dot com>

pkgname=deltacp
pkgver=0.1.8
pkgrel=1
pkgdesc="A copy tool designed for incremental backup of block device by utilizing reflink (CoW)"
url="https://codeberg.org/sharow/deltacp"
license=('MIT')
depends=('xxhash')
makedepends=('scdoc')
arch=('x86_64')
optdepends=(
    'python: for a inspectextents script that provides shared-extent analysis'
)
options=(zipman !debug)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('822ec606f06c488b6266aaaaefff637ff58de2f7a2ffd4b49bb17a58949f4a61')

build() {
    cd "${srcdir}/${pkgname}"
    make all
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 deltacp -t "${pkgdir}/usr/bin/"
    install -Dm755 inspectextents -t "${pkgdir}/usr/bin/"
    install -Dm644 deltacp.1 -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
