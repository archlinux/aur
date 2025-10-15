
# Maintainer: Denis Sheremet <aur@lxlz.space>
pkgname=yson-tools
pkgver=0.3.3
pkgrel=1
pkgdesc="A set of tools for working with YSON format"
arch=('x86_64')
url="https://github.com/lesf0/yson-tools"
license=('Apache-2.0')
depends=('jq' 'python-jsondiff')
makedepends=('git' 'go')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=("git+https://github.com/lesf0/yson-tools.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    export GOPATH="$srcdir"/go
    mkdir -p "$GOPATH"/src/github.com/lesf0/
    ln -sf "$srcdir/yson-tools" "$GOPATH"/src/github.com/lesf0/yson-tools

    cd "$GOPATH"/src/github.com/lesf0/yson-tools/yson-convert
    go build -o yson-convert .
}

package() {
    install -Dm755 "go/src/github.com/lesf0/yson-tools/yson-convert/yson-convert" "${pkgdir}/usr/bin/yson-convert"
    install -Dm755 "${srcdir}/yson-tools/ysonq" "${pkgdir}/usr/bin/ysonq"
    install -Dm755 "${srcdir}/yson-tools/yson-format" "${pkgdir}/usr/bin/yson-format"
    install -Dm755 "${srcdir}/yson-tools/ysondiff" "${pkgdir}/usr/bin/ysondiff"
}
