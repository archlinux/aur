# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=('exatorrent')
pkgver=0.0.1
pkgrel=2
pkgdesc="Self-hostable, easy-to-use, lightweight, and feature-rich torrent client written in Go"
provides=('exatorrent')
arch=('any')
license=('GPL3')
url="https://github.com/varbhat/exatorrent"
source=("git+${url}.git#tag=v${pkgver}")
makedepends=('go' 'git' 'npm')

sha256sums=('SKIP')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${pkgname}"
    make web
    go build -o build/"${pkgname}" "${pkgname}.go"
}

package() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${pkgname}"
    make web
    go build -o build/"${pkgname}" "${pkgname}.go"
    install -Dm 755 -t "${pkgdir}/usr/bin" build/exatorrent
}
