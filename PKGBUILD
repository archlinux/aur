# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="ulex"
pkgver="1.1"
pkgrel=1
epoch=
pkgdesc="ulex is a lexer generator for Unicode and OCaml"
arch=(x86_64)
url="http://www.cduce.org/"
license=('GPL')
groups=()
depends=('ocaml' 'camlp4')
makedepends=()
checkdepends=()
optdepends=()
provides=($pkgname)
conflicts=($pkgname)
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.cduce.org/download/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('ce49a013bc4a0e085977a9fe157017bf')
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
    # build native code as well
    sed -i '4s/.*/ALL=pa_ulex.cmxa ulexing.cmxa pa_ulex.cma ulexing.cma/' Makefile
}

build() {
    cd "$pkgname-$pkgver"
    make
    make doc
}

check() {
    cd "$pkgname-$pkgver"
}

package() {
    _DOCDIR="${pkgdir}/usr/share/doc/${pkgname}"

    cd "$pkgname-$pkgver"

    export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
    mkdir -p "${OCAMLFIND_DESTDIR}"
    make install

    # Install doc
    mkdir -p $_DOCDIR
    cp *.html *.css $_DOCDIR/
}
