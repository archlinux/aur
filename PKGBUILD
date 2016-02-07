# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-libocaml_uri
pkgver=2014.08.08
pkgrel=1
license=('GPL3')
arch=('i686' 'x86_64')
pkgdesc="OCaml library for URI"
url="http://git.grenouille.com/?p=libocaml_uri.git"
depends=('ocaml' 'ocaml-libocaml_exception' 'ocaml-libocaml_ipv4_address')
makedepends=('git' 'ocaml-findlib')
source=("git://git.autogeree.net/~julm/libocaml_uri.git#tag=v${pkgver//./-}"
        "git://git.autogeree.net/~julm/libocaml_make.git#tag=v2014-08-08"
        "git://git.autogeree.net/~julm/tool/pkg.git#tag=v2014-08-07")
options=('!strip')
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
