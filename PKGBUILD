# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: nerflad <nerflad@gmail.com>

_pkgname=biniou
pkgname=ocaml-${_pkgname}
pkgver=1.2.1
pkgrel=2
pkgdesc="An optimized parsing and printing library for JSON"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
depends=('ocaml-easy-format')
makedepends=('dune')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz")
sha256sums=('9e38566ede8f2593f9f743fb7da1c8a8674451eabe326b3e2b42a87834a66cb5')

build() {
    cd ${_pkgname}-${pkgver}
    make all
}

check() {
    cd ${_pkgname}-${pkgver}
    make test
}

package() {
    cd ${_pkgname}-${pkgver}
    DESTDIR="${pkgdir}" dune install --prefix=/usr --libdir="$(ocamlfind printconf destdir)"
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
    rm -r "${pkgdir}"/usr/doc
}
