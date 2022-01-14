# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=cshatag
pkgver=2.0
pkgrel=2
pkgdesc='Detect silent data corruption using checksums in Ext4 extended attributes'
arch=('x86_64')
url="https://github.com/rfjakob/cshatag"
makedepends=('go')
optdepends=('attr: Inspect extended file attributes')
license=('MIT')
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'ec06106f5bff76f4d7847151b19a1fbfd6934b3a2a292ae8f7f24b0f25907195'
)

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
    make test
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    install -vDm 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -vDm 644 cshatag.1    "${pkgdir}/usr/share/man/man1/cshatag.1"
    install -vDm 644 README.md    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -vDm 644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
