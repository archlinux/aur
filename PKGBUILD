# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=gotags-git
_pkgname=gotags
pkgver=20150322
pkgrel=1
pkgdesc="ctags-compatible tag generator for Go."
arch=("any")
url="https://github.com/jstemmer/gotags"
license=('Other')
makedepends=('git' 'go')
depends=()
provides=('gotags')
source=("${_pkgname}"::'git://github.com/jstemmer/gotags.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
    cd "${_pkgname}"
    GOPATH=${srcdir} go build -o "${_pkgname}"
}

package() {
    cd ${_pkgname}
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
