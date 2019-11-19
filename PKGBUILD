# Maintainer: Mikhail Swift <mikhail.swift@gmail.com>
pkgname=lazydocker
pkgver=0.7.6
pkgrel=1
pkgdesc='A simple terminal UI for docker and docker-compose, written in Go with the gocui library.'
arch=('1686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/jesseduffield/lazydocker'
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jesseduffield/lazydocker/archive/v${pkgver}.tar.gz")
sha1sums=('551a2c0bc96e6365d13f1fcff689427b96151f54')

build() {
    cd "${pkgname}-${pkgver}"
    go build \
        -gcflags=all=-trimpath=${PWD} \
        -asmflags=all=-trimpath=${PWD} \
        -ldflags=-extldflags=-zrelro \
        -ldflags=-extldflags=-znow \
        -ldflags "-s -w -X main.version=${pkgver}" \
        -o ${pkgname} \
        main.go
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
}
