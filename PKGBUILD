# Maintainer: Daniele Moser <dnlmsr0@gmail.com>
pkgname="buf-language-server-git"
pkgver=r11.05bbd97
pkgrel=1
pkgdesc="Protobuf language server"
arch=("x86_64")
url="https://github.com/bufbuild/buf-language-server"
license=("Apache-2.0")
makedepends=("go" "git")
source=("$pkgname::git+https://github.com/bufbuild/buf-language-server")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$pkgname/cmd/bufls"
    go build
}

package() {
    cd "$srcdir/$pkgname/cmd/bufls"
    install -Dm755 bufls "${pkgdir}/usr/bin/bufls"
}
