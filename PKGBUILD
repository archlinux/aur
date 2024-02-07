# Maintainer: Evine Deng <evinedeng@hotmail.com>

pkgname="ips"
pkgver=0.3.3
pkgrel=1
pkgdesc="IP geolocation databases tool and library."
arch=("any")
url="https://github.com/sjzar/${pkgname}"
license=("Apache")
depends=("glibc")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1671268770d884482323631dea8a2f4c21c5fb2775899a5363519974f8d6a31')

build() {
    cd "${pkgname}-${pkgver}"
    local ldflags=" \
        -s -w \
        -X github.com/sjzar/${pkgname}/cmd/${pkgname}.Version=v${pkgver} \
        -extldflags '${LDFLAGS}' \
    "
    go build \
        -trimpath \
        -ldflags "${ldflags}" \
        -o "${pkgname}" \
        main.go
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
}
