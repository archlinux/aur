# Maintainer: robertfoster
pkgname=ocaml-lame-git
pkgver=r85.5ed5784
pkgrel=1
pkgdesc="OCaml bindings to the LAME mp3 encoder"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-lame"
license=('GPL2')
depends=('ocaml' 'lame')
makedepends=('dune')
options=('!strip' '!makeflags')
source=("$pkgname::git+https://github.com/savonet/ocaml-lame")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    dune build
}

package() {
    cd "${srcdir}/${pkgname}"
    dune install --prefix "${pkgdir}/usr" --libdir \
        "${pkgdir}$(ocamlfind printconf destdir)"

    # Remove docs
    rm -rf "${pkgdir}/usr/doc"
}
md5sums=('SKIP')
