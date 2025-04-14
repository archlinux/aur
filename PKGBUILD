# Maintainer: Allen Zhong <pdev@zhoal.pw>
pkgname=yaml2json
pkgver=1.3.5
pkgrel=1
pkgdesc="Transform yaml string to json string without the type infomation."
url="https://github.com/bronze1man/yaml2json"
license=('MIT')
arch=('x86_64')
depends=('glibc')
makedepends=('go' 'git')
sha256sums=('f18a8322d1d1b0e9b0ea1966c8f1108ddc37c792f8cbe61d7605d9906c51aab3')
source=(
    $pkgname::git+https://github.com/bronze1man/yaml2json.git#tag=v$pkgver
)

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${srcdir}/${pkgname}"

    go build -o bin/yaml2json main.go
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "bin/yaml2json" "${pkgdir}/usr/bin/yaml2json"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/yaml2json/LICENSE"
}

