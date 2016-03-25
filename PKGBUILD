# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgname=gotags-git
_pkgname=gotags
pkgver=1.3.0.18.gbe986a3
epoch=1
pkgrel=1
pkgdesc="ctags-compatible tag generator for Go."
arch=('x86_64' 'i686')
url="https://github.com/jstemmer/gotags"
license=('MIT')
makedepends=('git' 'go')
depends=()
provides=('gotags')
source=("${_pkgname}"::'git://github.com/jstemmer/gotags.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    GOPATH=${srcdir} go build -o "${_pkgname}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}

