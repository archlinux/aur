# Maintainer: robertfoster
pkgname=ocaml-fdkaac-git
pkgver=r74.872fa6b
pkgrel=1
pkgdesc="OCaml binding for the fdk-aac library"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-fdkaac"
license=('GPL')
depends=('ocaml' 'libfdk-aac')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags')
source=("${pkgname}::git+https://github.com/savonet/ocaml-fdkaac.git")

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

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

md5sums=('SKIP')
