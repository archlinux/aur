# Maintainer: Lance Roy <ldr709@gmail.com>

srcname='dolog'
pkgname="ocaml-${srcname}"
pkgver='6.0.0'
pkgrel=1
pkgdesc='A dumb OCaml logger'
arch=('i686' 'x86_64')
url="https://github.com/UnixJunkie/dolog"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml'
    'ocaml-findlib'
    'dune')
source=("https://github.com/UnixJunkie/${srcname}/archive/v${pkgver}.tar.gz")
sha256sums=('2ad2aa639a21140e196491b9be3ebc03b5e5651c6b66db374c04ea6b69d0bd45')
options=('staticlibs')

prepare() {
    cd "$srcdir/${srcname}-${pkgver}"
    sed -i 's@\(dune install\)@\1'\
' --mandir="/usr/share/man"'\
' --docdir="/usr/share/doc/"'\
' --etcdir=/'' --datadir=/usr/share/'\
' --sbindir=/usr/sbin'\
' --bindir=/usr/bin'\
'@' Makefile
}

build() {
    cd "$srcdir/${srcname}-${pkgver}"

    env DESTDIR="$pkgdir" \
        make
}


package() {
    cd "$srcdir/${srcname}-${pkgver}"

    mkdir -p "$pkgdir/$(ocamlfind printconf destdir)"
    env DESTDIR="$pkgdir" \
        make install
}
