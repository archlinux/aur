# Maintainer: Allen Zhong <moeallenz@gmail.com>
pkgname=yaml2json
pkgver=1.3
pkgrel=1
pkgdesc="Transform yaml string to json string without the type infomation."
url="https://github.com/bronze1man/yaml2json"
license=('MIT')
arch=('x86_64')
makedepends=('go-pie' )
sha256sums=('fd0954936fef9f4848ef37debb25b26479495df0a8d46582e1e307cb29cdafc1')
source=(
    #https://github.com/bronze1man/yaml2json/releases/download/v${pkgver}/yaml2json_linux_amd64
    https://github.com/bronze1man/yaml2json/archive/v${pkgver}.tar.gz
)

build() {
    mkdir -p ${srcdir}/gobuild
    export GOPATH="${srcdir}/gobuild"

    mv "${srcdir}/${pkgname}-${pkgver}/vendor" "$GOPATH/src"

    mkdir -p "$GOPATH/src/github.com/bronze1man"
    cp -r "${srcdir}/${pkgname}-${pkgver}" $GOPATH/src/github.com/bronze1man/yaml2json

    cd "$GOPATH/src/github.com/bronze1man/yaml2json"
    #go run github.com/bronze1man/yaml2json/y2jBuilder
    go install -ldflags "-s -w" -gcflags=-trimpath=$GOPATH github.com/bronze1man/yaml2json
}

package() {
    export GOPATH="${srcdir}/gobuild"

    install -Dm755 "$GOPATH/bin/yaml2json" "${pkgdir}/usr/bin/yaml2json"
}

