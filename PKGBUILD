# Maintainer: larkly
pkgname=lazystack
pkgver=0.4.0
pkgrel=1
pkgdesc="A keyboard-driven terminal UI for OpenStack"
arch=('x86_64' 'aarch64')
url="https://github.com/larkly/lazystack"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}/src"
    export CGO_ENABLED=0
    go build -ldflags "-s -w -X main.version=v${pkgver}" -o "${pkgname}" ./cmd/lazystack
}

package() {
    cd "${pkgname}-${pkgver}/src"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
