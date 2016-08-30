# Maintainer: oliver < a t >  first . in-berlin . de
# former maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='cryptokit'
pkgname="ocaml-${srcname}"
pkgver='1.11'
pkgrel=1
pkgdesc='Cryptographic primitives for OCaml'
arch=('i686' 'x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'zarith') # OCaml as depend, or only makedepends?
makedepends=('ocaml' 'ocaml-findlib')
source=(http://forge.ocamlcore.org/frs/download.php/1618/cryptokit-$pkgver.tar.gz)
md5sums=('931f8240ad30d9930d0f584f2921de69')
options=('staticlibs')

build() {
    cd "$srcdir/${srcname}-${pkgver}"
    ./configure

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make
}


package() {
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
    cd "$srcdir/${srcname}-${pkgver}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
}
