# Maintainer: larkly
pkgname=lazystack
pkgver=0.7.1
pkgrel=1
pkgdesc="A keyboard-driven terminal UI for OpenStack"
arch=('x86_64' 'aarch64')
url="https://github.com/larkly/lazystack"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d0ff2c8c0086cdb09487382ed7f4b19bcbde165edba94656e2b8688db0c1d723')

build() {
    cd "${pkgname}-${pkgver}/src"
    export CGO_ENABLED=0
    go build -ldflags "-s -w -X main.version=v${pkgver} -X main.disableUpdateCheck=true" -o "${pkgname}" ./cmd/lazystack
}

package() {
    cd "${pkgname}-${pkgver}/src"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
