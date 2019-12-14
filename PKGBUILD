# Maintainer: robertfoster
pkgname=ocaml-dtools-git
pkgver=r100.c9df99e
pkgrel=1
pkgdesc="OCaml modules for writing daemons"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dtools"
license=('GPL2')
depends=('ocaml' 'ocaml-syslog')
makedepends=('ocaml-findlib')
options=('!strip')
source=("$pkgname::git+https://github.com/savonet/ocaml-dtools")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    ./bootstrap
    ./configure
    make
}

package() {
    cd "${srcdir}/${pkgname}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install
}
md5sums=('SKIP')
