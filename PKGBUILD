# Maintainer: pikl <me@pikl.uk>
_pkgroot=typesense
pkgname="${_pkgroot}-bin"
pkgver=0.25.2
pkgrel=1
pkgdesc="A fast, typo-tolerant search engine for building delightful search experiences."
arch=('x86_64')
url="https://github.com/typesense/typesense"
license=('GPL3')
provides=("${_pkgroot}")
source=("https://dl.typesense.org/releases/${pkgver}/${_pkgroot}-server-${pkgver}-linux-amd64.tar.gz"
        'typesense.sysusers' 'typesense.tmpfiles' 'typesense-server.service')
sha256sums=('0ae08a1401a01a1ab880a8a78d99fc6d1cf4042246e466ef5bbad26805ce849a'
            'b6075bd95e71f017d46967ccbba2ebcddcd87a55f7770ad67824a296c9d9cb24'
            '884e2b52f2c4314ee6614a5b7f2d662e48c9ef7e065ada28bcdebfcff924f348'
            '0b6b12af5ea5c12f0ef4321ab3cfbe54b9c4cf454921d7d6e970e3160631bad7')

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
