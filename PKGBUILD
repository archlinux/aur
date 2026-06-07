# Maintainer: Pony pony@just-a-pony.net

pkgname=realitlscanner
_pkgname=RealiTLScanner
pkgver=0.2.3
pkgrel=1
pkgdesc="A TLS server scanner for Reality "
arch=('x86_64')
url="https://github.com/XTLS/RealiTLScanner"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('55c389bea50e2a26c2965d99a8666c45d81e0f7ab70e57c32aaf689a53222edd')
build() {
    cd "${srcdir}"/"${_pkgname}-${pkgver}"/
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    go build -o realitlscanner .
}

package() {
    cd "${srcdir}"/"${_pkgname}-${pkgver}"/
    install -Dm 755 realitlscanner -t "${pkgdir}"/usr/bin/
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/realitlscanner/
}
