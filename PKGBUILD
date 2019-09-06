# Author: Bruno Pagani <archange@archlinux.org>
# Maintainer: nerflad <nerflad@gmail.com>

_pkgname=easy-format
pkgname=ocaml-${_pkgname}
pkgver=1.3.1
pkgrel=5
pkgdesc="Pretty-printing library for OCaml"
arch=('x86_64')
url="https://github.com/ocaml-community/${_pkgname}"
license=('BSD')
options=('!strip' 'staticlibs')
depends=('glibc')
makedepends=('dune')
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('489d55ea5de171cea2d7e2114bcd5cebd1fcbf89f839fbf3757769507502e1f0')

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
