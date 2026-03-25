# Maintainer: Shirow MIURA <shirowmiura at gmail dot com>

pkgname=deltacp
pkgver=0.1.1
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
sha256sums=('a9cf8b8bbb5d3604bf0723f24a57e845a1b98812131627839d6abdbe2ec95af9')

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
