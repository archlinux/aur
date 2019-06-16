# Maintainer: Andrea Berlingieri <andrea.berlingieri42 at gmail dot com>
pkgname=ocaml-expat
pkgver=0.9.1
pkgrel=1
pkgdesc="An ocaml wrapper for the Expat XML parsing library"
arch=('x86_64')
url="https://mmzeeman.home.xs4all.nl/ocaml/"
license=('custom')
depends=('expat')
makedepends=('ocaml' 'expat' 'ocaml-findlib')
changelog=ChangeLog
source=("https://mmzeeman.home.xs4all.nl/ocaml/ocaml-expat-0.9.1.tar.gz")
md5sums=('17aa00a46c5edeb815f1b0555bad7ed2')

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	make EXPAT_LIBDIR=/usr/lib EXPAT_INCDIR=/usr/include depend
	make EXPAT_LIBDIR=/usr/lib EXPAT_INCDIR=/usr/include allopt
    make doc
}

package() {
    OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "$OCAMLFIND_DESTDIR"
	cd "${srcdir}/$pkgname-$pkgver"
    env DESTDIR="${pkgdir}" \
        OCAMLFIND_DESTDIR="$OCAMLFIND_DESTDIR" \
        OCAMLFIND_LDCONF="ignore" \
    	make install
    install -Dm 644 LICENCE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    mkdir -p $pkgdir/usr/share/doc/$pkgname
    install -Dm 644 doc/*.html $pkgdir/usr/share/doc/$pkgname
}
