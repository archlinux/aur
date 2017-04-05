# Maintainer: oliver < a t >  first . in-berlin . de
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-mysql
pkgver=1.2.1
pkgrel=2
pkgdesc="OCaml bindings for MySQL"
arch=('i686' 'x86_64')
url="http://ocaml-mysql.forge.ocamlcore.org/"
license=('LGPL')
makedepends=('ocaml' 'ocaml-findlib' 'libmysqlclient')
depends=(camlp4)
options=('!strip' 'staticlibs')
#install=
source=(https://github.com/ygrek/ocaml-mysql/releases/download/v$pkgver/ocaml-mysql-$pkgver.tar.gz)
md5sums=('776d07219ac3a6ffa000811defd91eb3')

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
