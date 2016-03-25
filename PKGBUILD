# Maintainer: wenLiangcan <boxeed at gmail dot com>

_pkgname=goimports
pkgname=${_pkgname}-git
pkgver=r1800.824b504
epoch=1
pkgrel=1
pkgdesc="Tool to fix (add, remove) your Go imports automatically."
arch=('i686' 'x86_64')
url="https://github.com/bradfitz/goimports"
license=('MIT')
makedepends=('git' 'go' 'mercurial')
provides=("${_pkgname}")
_src='golang.org/x/tools/cmd/goimports'

pkgver() {
    GOPATH=${srcdir} go get -fix -u ${_src}
    cd src/${_src}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 bin/${_pkgname} $pkgdir/usr/bin/${_pkgname}
}

