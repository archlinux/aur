# Maintainer: Andrea Berlingieri <andrea.berlingieri42 at gmail dot com>
_pkgname=ocaml-http
pkgname=ocaml-http-git
pkgver=0.1.6
pkgrel=1
pkgdesc="OCaml library that lets you to write simple HTTP daemons"
arch=('x86_64')
url="https://github.com/sacerdot/ocaml-http"
license=('GPL2')
#depends=()
makedepends=('ocaml' 'ocaml-findlib' 'ocamlnet' 'ocaml-pcre')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_pkgname"
    git describe --abbrev=0 | sed 's/^v//'
}

build() {
	cd "${srcdir}/$_pkgname"
    make all opt
}

package() {
    OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "$OCAMLFIND_DESTDIR"
	cd "${srcdir}/$_pkgname"
    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
        OCAMLFIND_LDCONF="ignore" \
    	make install
}
