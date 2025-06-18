# Maintainer: Caesim404 <caesim404 at gmail dot com>

pkgname="hola-proxy"
pkgver=1.17.0
pkgrel=1
pkgdesc="Standalone Hola proxy client"
arch=(x86_64)
url="https://github.com/Snawoot/hola-proxy"
license=(MIT)
makedepends=(go)
source=("https://github.com/Snawoot/hola-proxy/archive/v${pkgver}.tar.gz")
sha256sums=('f7a1f5a9d1cf728864cb79df942212aaed67498428a37f17c824434f71db535b')

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
