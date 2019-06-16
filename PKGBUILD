# Maintainer: Andrea Berlingieri <andrea.berlingieri42 at gmail dot com>
pkgname=ulex08
pkgver=0.8
pkgrel=1
pkgdesc="OCaml lexer generator with Unicode support - CamlP5 version - version 0.8"
arch=('x86_64')
url="http://www.cduce.org/download.html"
license=('custom')
#depends=('ocaml' 'expat' 'ocaml-findlib')
makedepends=('ocaml' 'ocaml-findlib' 'camlp5')
source=($pkgname-$pkgver::'http://deb.debian.org/debian/pool/main/u/ulex0.8/ulex0.8_0.8.orig.tar.gz')
md5sums=('baf9fe9fc381c7824a2e0e368da5fa13')

_name=ulex

prepare() {
	cd "${srcdir}/$_name-$pkgver"
	patch -p1 -i "../../$pkgname-$pkgver.patch"
}

build() {
	cd "${srcdir}/$_name-$pkgver"
    env OCAMLPARAM="safe-string=0,_" make all all.opt
}

package() {
    OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "$OCAMLFIND_DESTDIR"
	cd "${srcdir}/$_name-$pkgver"
    make DESTDIR="$OCAMLFIND_DESTDIR" install
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
