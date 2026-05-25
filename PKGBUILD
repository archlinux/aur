# Maintainer: Austin Choi <austinch20@protonmail.com>
pkgname=botbox
pkgver=2.5.3
pkgrel=1
pkgdesc='A CLI tool for scaffolding, configuring, and managing Discord bot projects'
arch=('x86_64' 'aarch64')
url='https://github.com/choice404/botbox'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f692944ee1255699abf57323b83fecbbabbb388936de5bc0a200e4c96ccb6868')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w" -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
