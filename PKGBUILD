# Maintainer: pikl <me@pikl.uk>
_pkgroot=typesense
pkgname="${_pkgroot}-bin"
pkgver=0.25.0
pkgrel=2
epoch=
pkgdesc="A fast, typo-tolerant search engine for building delightful search experiences."
arch=('x86_64')
url="https://github.com/typesense/typesense"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_pkgroot}")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://dl.typesense.org/releases/${pkgver}/${_pkgroot}-server-${pkgver}-linux-amd64.tar.gz"
        'typesense.sysusers' 'typesense.tmpfiles' 'typesense-server.service')
noextract=()
sha256sums=('fc40c361a18fe372ee3aaf74571f33fdf9a9e28ba0cae8933f52f90e640f6744'
            '3b9885c11980dfed653c98ee04c440a513f44a9676b8194623380381e9a6e1b1'
            '884e2b52f2c4314ee6614a5b7f2d662e48c9ef7e065ada28bcdebfcff924f348'
            '0b6b12af5ea5c12f0ef4321ab3cfbe54b9c4cf454921d7d6e970e3160631bad7')
validpgpkeys=()

check() {
    cd "${srcdir}"
    diff -q <(md5sum typesense-server | awk '{printf $1}') typesense-server.md5.txt
}

package() {
    cd "${srcdir}"
    install -D -m 0755 typesense-server "${pkgdir}/usr/lib/typesense-server"
    install -D -m 0644 typesense.sysusers "${pkgdir}/usr/lib/sysusers.d/typesense.conf"
    install -D -m 0644 typesense.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/typesense.conf"
    install -D -m 0644 typesense-server.service "${pkgdir}/usr/lib/systemd/system/typesense-server.service"
}

