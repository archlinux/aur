# Maintainer: larkly
pkgname=lazystack
pkgver=0.9.1
pkgrel=1
pkgdesc="A keyboard-driven terminal UI for OpenStack"
arch=('x86_64' 'aarch64')
url="https://github.com/larkly/lazystack"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('920a0a09137be57a218e76ba714b5dfa5b4f95f8a17395496e6c9b35314758f9')

build() {
    cd "${pkgname}-${pkgver}/src"
    export CGO_ENABLED=0
    go build -ldflags "-s -w -X main.version=v${pkgver} -X main.disableUpdateCheck=true" -o "${pkgname}" ./cmd/lazystack
}

package() {
    cd "${pkgname}-${pkgver}/src"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
