# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

srcname='zed'
pkgname="ocaml-${srcname}"
pkgver='1.3'
pkgrel=1
pkgdesc='An abstract engine for text editing'
arch=('i686' 'x86_64')
url='https://github.com/diml/zed'
license=('BSD')
depends=('ocaml' 'ocaml-camomile' 'ocaml-react')
makedepends=('ocaml-findlib')
source=("https://github.com/diml/zed/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('59f1d4b08f4b156f21d2378d34fc5b7d')

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
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
