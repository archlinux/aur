# Maintainer: robertfoster
pkgname=ocaml-lame-git
pkgver=r76.d9fc714
pkgrel=1
pkgdesc="OCaml bindings to the LAME mp3 encoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lame"
license=('GPL2')
depends=('ocaml' 'lame')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags')
source=("$pkgname::git+https://github.com/savonet/ocaml-lame")

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
    mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
    make install
}
md5sums=('SKIP')
