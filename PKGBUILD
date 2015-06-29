# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=syncthing-cli-git
_pkgname=syncthing-cli
pkgver=r32.144a17a
pkgrel=1
pkgdesc="Official command line client for syncthing"
url="https://github.com/syncthing/syncthing-cli"
license=('MIT')
arch=('i686' 'x86_64')
depends=('syncthing')
makedepends=('git' 'go' 'godep')
source=("$_pkgname::git+https://github.com/syncthing/syncthing-cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}"
    mkdir -p "src/github.com/syncthing"
    mv "${_pkgname}" "src/github.com/syncthing/${_pkgname}"
}

build() {
    export GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/syncthing/${_pkgname}"
    go get
    go build
}

package() {
    cd "${srcdir}/src/github.com/syncthing/${_pkgname}"
    install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}
