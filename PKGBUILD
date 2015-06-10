# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

srcname='lambda-term'
pkgname="ocaml-${srcname}"
pkgver='1.8'
pkgrel=1
pkgdesc='A cross-platform library for manipulating the terminal'
arch=('i686' 'x86_64')
url='https://github.com/diml/lambda-term'
license=('BSD')
depends=('ocaml' 'ocaml-lwt' 'ocaml-react' 'ocaml-zed')
makedepends=('ocaml-findlib')
source=("https://github.com/diml/lambda-term/archive/${pkgver}.tar.gz")
options=('!strip')
md5sums=('77c09a0a58beae9f092db6e91ddae808')

build() {
    cd "$srcdir/${srcname}-${pkgver}"
    ./configure --prefix /usr --destdir "$pkgdir"

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
