# Maintainer: oliver < a t >  first . in-berlin . de
pkgname_=rss
pkgname=ocaml-$pkgname_
pkgver=2.2.2
pkgrel=2
pkgdesc="Library providing functions to parse and print RSS 2.0 files"
arch=('i686' 'x86_64')
license=('LGPL3')
source=("https://framagit.org/zoggy/ocamlrss/-/archive/$pkgver/ocamlrss-$pkgver.tar.gz")
md5sums=('3aaa2c37476caa9b4fcc0a172d73d120')
url="https://ocaml.org/p/ocamlrss/2.2.2"
depends=()
###makedepends=('ocaml' 'ocaml-findlib' 'ocaml-xmlm' 'ocamlnet')
makedepends=('ocaml' 'ocaml-findlib' 'ocaml-xmlm')
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
