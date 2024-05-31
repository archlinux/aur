# Maintainer: "Winni Neessen (https://pebcak.de)

pkgname=apg-go
pkgver=1.2.0
pkgrel=2
pkgdesc='A modern "Automated Password Generator"-clone'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/wneessen/apg-go'
license=('MIT')
makedepends=('go')
source=("https://github.com/wneessen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dfe7633a6fe7fd40f9fc2ae43ce66a5d8224a732b8051f65504123fe0a95bb40')
options=('!debug')
conflicts=('apg')

prepare() {
    cd "${pkgname}-${pkgver}"
    mkdir -p build/
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOPATH="${srcdir}"
    go build -trimpath -ldflags '-w -s -extldflags "-static"' -o "build/${pkgname}" github.com/wneessen/apg-go/cmd/apg
}

package() {
    cd "${pkgname}-${pkgver}"
    # binary
    install -D -m755 "build/${pkgname}" "${pkgdir}/usr/bin/apg"

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
