# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-libocaml_ipv4_address
pkgver=2014.08.08
pkgrel=1
pkgdesc="OCaml library for IPv4 address"
arch=('i686' 'x86_64')
url="http://git.grenouille.com/?p=libocaml_ipv4_address.git"
license=('GPL3')
depends=('ocaml' 'ocaml-libocaml_lexing' 'ocaml-libocaml_option')
makedepends=('git' 'ocaml-findlib')
options=('!strip')
source=("git://git.autogeree.net/~julm/libocaml_ipv4_address.git#tag=v${pkgver//./-}"
        "git://git.autogeree.net/~julm/libocaml_make.git#tag=v2014-08-08"
        "git://git.autogeree.net/~julm/tool/pkg.git#tag=v2014-08-07")
md5sums=('SKIP'
         'SKIP'
         'SKIP')

prepare() {
    cd "${srcdir}/${pkgname#ocaml-}"

    git submodule init
    git config submodule.lib/libocaml/make.url "${srcdir}/libocaml_make"
    git config submodule.lib/tool/pkg.url "${srcdir}/pkg"
    git submodule update
}

build() {
    cd "${srcdir}/${pkgname#ocaml-}"

    make OCAML_FLAGS=
}

package() {
    cd "${srcdir}/${pkgname#ocaml-}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlc -where)"
    install -dm755 "${OCAMLFIND_DESTDIR}"
    make install DESTDIR="${OCAMLFIND_DESTDIR}"
}
