# Maintainer:  Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ocamlsdl
pkgver=0.9.1
pkgrel=4
pkgdesc="OCaml interface to the SDL (Simple DirectMedia Layer) library"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ocamlsdl/"
license=('LGPL2.1')
depends=('ocaml' 'ocaml-lablgl' 'sdl' 'sdl_ttf' 'sdl_image' 'sdl_mixer' 'sdl_gfx')
makedepends=('ocaml-findlib')
options=('!strip')
source=("http://downloads.sourceforge.net/project/ocamlsdl/OCamlSDL/${pkgname#ocaml-}-${pkgver}/${pkgname#ocaml-}-${pkgver}.tar.gz")
md5sums=('c3086423991fcdc1ba468afd52fc112b')

build() {
    cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

    ./configure
    make OCAMLC="ocamlc.opt -unsafe-string" \
      OCAMLOPT="ocamlopt.opt -unsafe-string"
}

package() {
    cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}/stublibs"
    make install
}
