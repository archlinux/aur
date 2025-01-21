# Maintainer: Allen Zhong <pdev@zhoal.pw>
pkgname=yaml2json
pkgver=1.3.4
pkgrel=2
pkgdesc="Transform yaml string to json string without the type infomation."
url="https://github.com/bronze1man/yaml2json"
license=('MIT')
arch=('x86_64')
depends=('glibc')
makedepends=('go' 'git')
sha256sums=('b09254eb06fee748db9251f7169e6c6ba887fb543a04b68d7a2e4d10472a2f37')
source=(
    $pkgname::git+https://github.com/bronze1man/yaml2json.git#tag=v1.3.4
)

pkgver() {
  cd $pkgname
  git describe --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g;s/^v//"
}

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

