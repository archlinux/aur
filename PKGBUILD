# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-mysql
pkgver=1.2.0
pkgrel=1
pkgdesc="OCaml bindings for MySQL"
arch=('i686' 'x86_64')
url="http://ocaml-mysql.forge.ocamlcore.org/"
license=('LGPL')
makedepends=('ocaml' 'ocaml-findlib' 'libmysqlclient')
depends=(camlp4)
options=('!strip' 'staticlibs')
#install=
source=(https://forge.ocamlcore.org/frs/download.php/1472/ocaml-mysql-$pkgver.tar.gz)
md5sums=('81d3bf217e4ed1829b9ea19f037dce65')

build() {

  cd "$srcdir/ocaml-mysql-$pkgver"

  ./configure || return 1
  make reallyall || return 1

}

package() {
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF="ignore"

  cd "$srcdir/ocaml-mysql-$pkgver"
  install -d $OCAMLFIND_DESTDIR || return 1

  make install || return 1

}

# vim:set ts=2 sw=2 et:
