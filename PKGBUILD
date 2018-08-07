pkgname=ocaml-ocplib-simplex-git
pkgver=r38.g5bee435
pkgrel=1

pkgdesc='simplex algorithm implementation for solving systems of linear inequalities and optimizing linear objective functions'
url='https://github.com/OCamlPro-Iguernlala/ocplib-simplex'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('ocaml')
makedepends=('ocaml-findlib' 'git')

provides=('ocaml-ocplib-simplex')
conflicts=('ocaml-ocplib-simplex')

source=('git+https://github.com/OCamlPro-Iguernlala/ocplib-simplex'
        'fix-makefile-install-target.diff')

sha256sums=('SKIP'
            '273455a20fd9a291956904fe48734d2e602ab07211d6833968f5ca0ecc271a31')

prepare() {
    cd ocplib-simplex
    # https://github.com/OCamlPro-Iguernlala/ocplib-simplex/issues/6
    patch -Np1 -i "$srcdir"/fix-makefile-install-target.diff
}

pkgver() {
    cd ocplib-simplex
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ocplib-simplex
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

check() {
    cd ocplib-simplex
    # XXX tests require opam
    # make tests
}

package() {
    cd ocplib-simplex
    make DESTDIR="$pkgdir" install
}
