# Maintainer: larkly
pkgname=lazystack
pkgver=0.11.0
pkgrel=1
pkgdesc="A keyboard-driven terminal UI for OpenStack"
arch=('x86_64' 'aarch64')
url="https://github.com/larkly/lazystack"
license=('Apache-2.0')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5fb4926d5549e74fa9b454b52f49a4ca7171d0941cf18153a69f8b765a6fa316')

build() {
    cd "${pkgname}-${pkgver}/src"
    export CGO_ENABLED=0
    go build -ldflags "-s -w -X main.version=v${pkgver} -X main.disableUpdateCheck=true" -o "${pkgname}" ./cmd/lazystack
}

package() {
    cd "${pkgname}-${pkgver}/src"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
