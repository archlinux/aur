# Maintainer: "Winni Neessen (https://pebcak.de)

pkgname=apg-go
pkgver=1.1.0
pkgrel=1
pkgdesc='A "Automated Password Generator"-clone'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/apg-go'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1ba10adedd73d7a3a39a3b2524f4e7958ff50fc54b61e43a8cc3487b6c72c147')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${pkgname}-${pkgver}"
    go build -ldflags="-s -w" -o build/${pkgname} github.com/wneessen/apg-go/cmd/apg
}

package() {
    # binary
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/build/${pkgname}" \
        "${pkgdir}/usr/bin/apg"

    # license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
