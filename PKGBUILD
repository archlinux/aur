# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: oliver < a t >  first . in-berlin . de
# Contributor: Gregory BELLIER <gregory.bellier -- gmail -- com>

pkgname=ocaml-mysql
pkgver=1.2.4
pkgrel=2
pkgdesc="OCaml bindings for MySQL"
arch=('i686' 'x86_64')
url="http://ocaml-mysql.forge.ocamlcore.org/"
license=('LGPL')
makedepends=('ocaml-findlib' 'libmariadbclient')
depends=('ocaml' 'zlib' 'camlp4')
options=('!strip' 'staticlibs')
source=(https://github.com/ygrek/ocaml-mysql/releases/download/v$pkgver/ocaml-mysql-$pkgver.tar.gz)
sha512sums=('d22269cd24a7c2ed1ccf91c6c8a330cf5a8006cb40b368fe2fa90a543a5e01437e884de4d1c2009b7ce7f34fec070f73d98372dfebb0e69c516681731c725e4a')

build() {
  cd "$srcdir/ocaml-mysql-$pkgver"

  ./configure
  make
  make opt
}

package() {
  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  export OCAMLFIND_LDCONF="ignore"

  cd "$srcdir/ocaml-mysql-$pkgver"
  install -d $OCAMLFIND_DESTDIR 

  make install 

}

# vim:set ts=2 sw=2 et:
