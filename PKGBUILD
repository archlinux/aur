# Maintainer: oliver < a t >  first . in-berlin . de
# former maintainer: Taylor Venable <taylor@metasyntax.net>

srcname='cryptokit'
pkgname="ocaml-${srcname}"
pkgver='1.13'
pkgrel=1
pkgdesc='Cryptographic primitives for OCaml'
arch=('i686' 'x86_64')
url="http://pauillac.inria.fr/~xleroy/software.html#cryptokit"
license=('LGPL')
depends=('ocaml' 'zlib' 'zarith') # OCaml as depend, or only makedepends?
makedepends=('ocaml' 'ocaml-findlib' 'ocamlbuild')
source=("https://github.com/xavierleroy/cryptokit/archive/release113.tar.gz")
md5sums=('4d726550381af513ccf56dfc94849c89')
options=('staticlibs')

releaseshort () {
  RELNUM=`echo $pkgver | sed -e "s/\.//g"`
}

build() {
    releaseshort
    cd "$srcdir/${srcname}-release${RELNUM}"

    ./configure

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make
}


package() {
    releaseshort
    cd "$srcdir/${srcname}-release${RELNUM}"

    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
    #cd "$srcdir/${srcname}-${pkgver}"
    cd "$srcdir/${srcname}-release${RELNUM}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
}
