pkgname=ocaml-ocplib-simplex-git
pkgver=0.5.r0.g9b0944c
pkgrel=4

pkgdesc='simplex algorithm implementation for solving systems of linear inequalities and optimizing linear objective functions'
url='https://github.com/OCamlPro-Iguernlala/ocplib-simplex'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('ocaml' 'ocaml-num' 'ocaml-logs')
makedepends=('ocaml-findlib' 'git' 'dune')

provides=('ocaml-ocplib-simplex')
conflicts=('ocaml-ocplib-simplex')

source=('git+https://github.com/OCamlPro-Iguernlala/ocplib-simplex'
        'dirs.patch')

sha256sums=('SKIP'
            '18b406548801f5c54b3f2fce5dcd56ad94f923cbe81b93d9c0aa4df0e76f5c8a')

pkgver() {
    cd ocplib-simplex
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
}

prepare() {
    cd ocplib-simplex
    patch -p1 < ../dirs.patch
}

build() {
    cd ocplib-simplex
    make
}

check() {
    cd ocplib-simplex
    # XXX tests require opam
    # make tests
}

package() {
    cd ocplib-simplex
    make LIBDIR="$(ocamlc -where)" DESTDIR="$pkgdir" install
}
