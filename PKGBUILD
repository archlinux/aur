# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-libocaml_exception
pkgver=2014.08.08
pkgrel=1
pkgdesc="OCaml library for statically-typed exceptions"
arch=('i686' 'x86_64')
url="http://git.grenouille.com/?p=libocaml_exception.git"
license=('GPL3')
depends=('ocaml' 'ocaml-lwt')
makedepends=('git' 'ocaml-findlib')
options=('!strip')
source=("git://git.autogeree.net/~julm/libocaml_exception.git#tag=v${pkgver//./-}"
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

    make
}

package() {
    cd "${srcdir}/${pkgname#ocaml-}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlc -where)"
    install -dm755 "${OCAMLFIND_DESTDIR}"
    make install DESTDIR="${OCAMLFIND_DESTDIR}"
}
