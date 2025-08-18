# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname="hola-proxy"
pkgver=1.18.1
pkgrel=1
pkgdesc="Standalone Hola proxy client"
arch=(x86_64)
url="https://github.com/Snawoot/hola-proxy"
license=(MIT)
makedepends=(go)
source=("https://github.com/Snawoot/hola-proxy/archive/v${pkgver}.tar.gz")
sha256sums=('bbe55814099eda55e2dd20bcf3814234bf4654ae92c49249a56a87e7a6c927b3')

build() {
    cd "${pkgname}-${pkgver}"

    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    make VERSION="v${pkgver}" install
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "$srcdir/gopath/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
