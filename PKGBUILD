# Maintainer: oliver < a t >  first . in-berlin . de
pkgname_=rss
pkgname=ocaml-$pkgname_
pkgver=2.2.2
pkgrel=1
pkgdesc="Library providing functions to parse and print RSS 2.0 files"
arch=('i686' 'x86_64')
license=('LGPL3')
source=(http://zoggy.github.io/ocamlrss/ocamlrss-$pkgver.tar.gz)
md5sums=('072eb405de941d6d07d3780a5a5d01f5')
url="http://zoggy.github.io/ocamlrss/"
depends=()
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-xmlm' 'ocamlnet')
options=(!makeflags)

build() {
cd ${srcdir}/ocamlrss-${pkgver}
make all
}


package() {
cd ${srcdir}/ocamlrss-${pkgver}

# setup ENV-variables for destination-directories in pkgdir
OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
OCAMLFIND_LDCONF="$pkgdir/$(ocamlfind printconf ldconf)"

# create destdir under package-directory
mkdir -p ${OCAMLFIND_DESTDIR}

# make install
env OCAMLFIND_DESTDIR="${OCAMLFIND_DESTDIR}" OCAMLFIND_LDCONF="${OCAMLFIND_LDCONF}" make install
}
