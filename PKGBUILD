# Maintainer: David Borzek <dev@davidborzek.de>
_pkgname=spofi
pkgname=spofi-git
pkgver=1.0
pkgrel=2
pkgdesc="Control spotify using rofi."
arch=(x86_64)
url="https://github.com/davidborzek/spofi"
license=('MIT')
depends=('rofi')
makedepends=('go' 'git')
provides=(spofi)
source=("$_pkgname"::"git+$url#branch=main")
md5sums=('SKIP')

build() {
    cd "${_pkgname}"
    if [[ "$GOPATH" == "" ]]; then
        GOPATH="$HOME/go" go build -o spofi
    else
        go build -o spofi
    fi
}

package() {
    cd "${_pkgname}"
    install -Dm755 spofi "${pkgdir}/usr/bin/spofi"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}"
}
