# Maintainer: Allen Zhong <pdev@zhoal.pw>
pkgname=yaml2json
pkgver=1.3.2
pkgrel=1
pkgdesc="Transform yaml string to json string without the type infomation."
url="https://github.com/bronze1man/yaml2json"
license=('MIT')
arch=('x86_64')
makedepends=('go' 'git')
sha256sums=('60cde1335a51366b3d4f24b3e8fea258cdbbda323e41f206e8b4c9875ec1138d')
source=(
    $pkgname::git+https://github.com/bronze1man/yaml2json.git#tag=v1.3.2
)

pkgver() {
  cd $pkgname
  git describe --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g;s/^v//"
}

build() {
    mkdir -p ${srcdir}/gobuild
    export GOPATH="${srcdir}/gobuild"

    mkdir -p "$GOPATH/src/github.com/bronze1man"
    cp -r "${srcdir}/${pkgname}" $GOPATH/src/github.com/bronze1man/yaml2json

    cd "$GOPATH/src/github.com/bronze1man/yaml2json"
    go install -ldflags "-s -w" -gcflags=-trimpath=$GOPATH github.com/bronze1man/yaml2json
}

package() {
    export GOPATH="${srcdir}/gobuild"

    install -Dm755 "$GOPATH/bin/yaml2json" "${pkgdir}/usr/bin/yaml2json"
}

