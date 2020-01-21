# Maintainer: Lance Roy <ldr709@gmail.com>

srcname='dolog'
pkgname="ocaml-${srcname}"
pkgver='3.0'
pkgrel=1
pkgdesc='A dumb OCaml logger'
arch=('i686' 'x86_64')
url="https://github.com/UnixJunkie/dolog"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml'
	'ocaml-findlib')
source=("https://github.com/UnixJunkie/${srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('b0efb70e5e29cae47a571940b84645029da32ca36ede7032bf9e491fd7e2e877')
options=('staticlibs')

build() {
    cd "$srcdir/${srcname}-${pkgver}"

    ./configure

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make
}


package() {
    cd "$srcdir/${srcname}-${pkgver}"

    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
}
