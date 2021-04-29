# Maintainer: "Winni Neessen (https://pebcak.de)

pkgname=apg-go
pkgver=0.3.2
pkgrel=1
pkgdesc='A "Automated Password Generator"-clone'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/apg-go'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('42f082d2f54d1cb20e1d6d63c1d923255b711151c937041f64164180758ce0e4')

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
