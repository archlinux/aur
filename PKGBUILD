# Maintainer: Mikhail Swift <mikhail.swift@gmail.com>
pkgname=lazydocker
pkgver=0.8
pkgrel=2
pkgdesc='A simple terminal UI for docker and docker-compose, written in Go with the gocui library.'
arch=('1686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/jesseduffield/lazydocker'
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jesseduffield/lazydocker/archive/v${pkgver}.tar.gz")
sha1sums=('286dd183eb16ace1689dddb2c44f21f657e13b74')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o ${pkgname} main.go
}

package() {
    install -Dm755 "${pkgname}-${pkgver}/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
}
