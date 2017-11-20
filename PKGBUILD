# Maintainer: Oliver Bandel < oliver _at_ first . in - berlin . de >
# orig Contributor: Denis Wernert <denis@wernert.info>
pkgname=ocaml-csv
pkgver=1.5
pkgrel=2
pkgdesc="OCaml CSV parsing library"
arch=('i686' 'x86_64')
url="https://github.com/Chris00/ocaml-csv"
license=('GPL')
depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib' 'ocamlbuild')
builddepends=('ocaml')
source=(https://github.com/Chris00/ocaml-csv/releases/download/$pkgver/csv-$pkgver.tar.gz)
md5sums=('93fb7204e3a2d38184ddce545d03c2fb')
sha256sums=('f6307634e5f5fe3d64b90fdf8841b3f50dac80ed45b40d390ee44490c62bf58f')
options=(!libtool !strip zipman)

build() {
  cd csv-$pkgver
  sed -i s@/usr/local@$pkgdir/usr@g setup.ml
  make
}

package() {
  cd csv-$pkgver
  #SITE=$pkgdir`ocamlc -where`/site-lib
  SITE=$pkgdir`ocamlc -where`
  install -d $SITE -m 755
  OCAMLFIND_DESTDIR=$SITE make install
}

# vim:set ts=2 sw=2 et:
