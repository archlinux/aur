# Maintainer: "Winni Neessen (https://pebcak.de)

pkgname=apg-go
pkgver=0.3.0
pkgrel=1
pkgdesc='A "Automated Password Generator"-clone'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/apg-go'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('acb750ac03de7d467ef3b5f576a7b7eea47d0a4f521c2647d80f0ebe641d3c56')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${pkgname}-${pkgver}"
    go build -ldflags="-s -w" -o build/${pkgname} ./...
}

package() {
    # binary
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" \
        "${pkgdir}/usr/bin/apg"

    # license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
