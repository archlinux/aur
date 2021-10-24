# Maintainer: "Winni Neessen (https://pebcak.de)

pkgname=apg-go
pkgver=0.4.0
pkgrel=2
pkgdesc='A "Automated Password Generator"-clone'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/apg-go'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('21704158cbf9ae34d821169ff755a8381fd6b6b0d52d243fbb4a893c84bf6f4c')

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
