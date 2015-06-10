# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

srcname='utop'
pkgname="ocaml-${srcname}"
pkgver='1.17'
pkgrel=1
pkgdesc='A toplevel for OCaml that supports completion, colors, and parenthesis matching'
arch=('i686' 'x86_64')
url='https://github.com/diml/utop'
license=('BSD')
depends=('ocaml>=4.01.0' 'ocaml-lambda-term>=1.2' 'cppo>=1.0.1' 'ocaml-findlib' 'ocaml-zed>=1.2' 'ocaml-zed<=1.3')
source=("https://github.com/diml/utop/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('79dcabf1b3704ee11bc55cdd92a8490c')

build() {
    cd "$srcdir/${srcname}-${pkgver}"
    ./configure --prefix /usr --destdir "$pkgdir" --enable-camlp4

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make
}


package() {
    install -dm755 "$pkgdir/$(ocamlfind printconf destdir)"
    install -dm755 "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
    cd "$srcdir/${srcname}-${pkgver}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
