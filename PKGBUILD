# Maintainer: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Justin Davis <jrcd 83 at gmail>

pkgname=cppo
pkgver=1.6.1
pkgrel=1
pkgdesc="The C preprocessor written in OCaml"
arch=('i686' 'x86_64' 'armv7h')
license=('BSD')
depends=('glibc')
makedepends=('jbuilder' 'ocaml-findlib' 'ocamlbuild' 'clingo' 'python2')
url="https://github.com/mjambon/cppo"
source=("https://github.com/mjambon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0e93522c5e51a9433fc2327f33ebc56f66beee7abaacab8d98de57591a0626e6')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make all
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    export OPAMROOT="${srcdir}/.opam"
    opam init -n
    mkdir -p "${pkgdir}/usr/bin" "$pkgdir$(ocamlfind printconf destdir)"
    export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
    install -dm755 $OCAMLFIND_DESTDIR
    cd _build/install/default/bin
    install -m755 -t ${pkgdir}/usr/bin cppo
}
