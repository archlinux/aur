# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

_pkgname="lambda-term"
pkgname="ocaml-${_pkgname}"
pkgver=1.10
pkgrel=1
pkgdesc='A cross-platform library for manipulating the terminal'
arch=('i686' 'x86_64')
url='https://github.com/diml/lambda-term'
license=('BSD')
depends=('ocaml' 'ocaml-lwt' 'ocaml-react' 'ocaml-zed')
makedepends=('ocaml-findlib')
source=("https://github.com/diml/lambda-term/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('ce9cc6503a01f327d414988f97343635')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    ./configure --prefix /usr --destdir "$pkgdir"

    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make
}


package() {
    install -dm755 "$pkgdir/$(ocamlfind printconf destdir)"
    install -dm755 "$pkgdir/$(ocamlfind printconf destdir)/stublibs"
    cd "$srcdir/${_pkgname}-${pkgver}"
    env DESTDIR="$pkgdir" \
        OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)" \
        make install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
