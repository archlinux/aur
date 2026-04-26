# Maintainer: Your Name <your@email.com>
pkgname=bt
pkgver=1.2.2
pkgrel=1
pkgdesc="Interactive tree-like terminal file manager"
arch=('x86_64' 'aarch64')
url="https://github.com/LeperGnome/bt"
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LeperGnome/bt/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('781dd37a0a28d56aaff80c0757a22a8c8d46d2f1db38689383bbe517ded3e4bbaa7cc537912488f97a7ea7c41886c699ee192633364ac382c8a8c0a3d7e40a84')

prepare() {
    cd "${pkgname}-${pkgver}"
    go mod download
}

build() {
    cd "${pkgname}-${pkgver}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "${pkgname}" ./cmd/bt
}

check() {
    cd "${pkgname}-${pkgver}"
    go test ./...
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
