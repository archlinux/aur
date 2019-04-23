pkgname=ocaml-ocplib-simplex-git
pkgver=0.4.r4.gd52771f
pkgrel=1

pkgdesc='simplex algorithm implementation for solving systems of linear inequalities and optimizing linear objective functions'
url='https://github.com/OCamlPro-Iguernlala/ocplib-simplex'
arch=('i686' 'x86_64')
license=('LGPL')

depends=('ocaml')
makedepends=('ocaml-findlib' 'git')

provides=('ocaml-ocplib-simplex')
conflicts=('ocaml-ocplib-simplex')

source=('git+https://github.com/OCamlPro-Iguernlala/ocplib-simplex')

sha256sums=('SKIP')

pkgver() {
    cd ocplib-simplex
    git describe --long --tags | sed -r 's/^v//; s/([^-]*-g)/r\1/; s/-/./g'
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
    make LIBDIR="$(ocamlc -where)" DESTDIR="$pkgdir" install
}
