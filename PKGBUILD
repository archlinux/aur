# Maintainer: Andrea Berlingieri <andrea.berlingieri42 at gmail dot com>
pkgname=ocaml-http
pkgver=0.1.6
pkgrel=1
pkgdesc="OCaml library that lets you to write simple HTTP daemons"
arch=('x86_64')
url="https://github.com/sacerdot/ocaml-http"
license=('GPL2')
#depends=()
makedepends=('ocaml' 'ocaml-findlib' 'ocamlnet' 'ocaml-pcre')
#options=()
#install=
#changelog=
source=("git+$url.git")
#noextract=()
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$pkgname"
    git describe --abbrev=0 | sed 's/^v//'
}

build() {
	cd "${srcdir}/$pkgname"
    make all opt
}

package() {
    OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "$OCAMLFIND_DESTDIR"
	cd "${srcdir}/$pkgname"
    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
        OCAMLFIND_LDCONF="ignore" \
    	make install
}
