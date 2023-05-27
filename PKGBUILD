# Maintainer: Pony pony@just-a-pony.net

pkgname=realitlscanner
_pkgname=RealiTLScanner
pkgver=0.1.2
pkgrel=1
pkgdesc="A TLS server scanner for Reality "
arch=('x86_64')
url="https://github.com/XTLS/RealiTLScanner"
license=('MPL2')
depends=('glibc')
makedepends=('go')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('5f0db39ae602a7696337181e5f015b18e34ed8e361321f8a921c157fabc55cff')
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
