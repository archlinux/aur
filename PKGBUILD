# Maintainer: "Winni Neessen (https://pebcak.de)

pkgname=apg-go
pkgver=1.0.0
pkgrel=1
pkgdesc='A "Automated Password Generator"-clone'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/apg-go'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ec5d3345676c8abc692f80f71d0180d772634c7c2b935c371474de85ff6a0538')

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
