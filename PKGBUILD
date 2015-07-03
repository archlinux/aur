# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Chris Perl <chris.perl@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

_pkgname=res
pkgname=ocaml-${_pkgname}
pkgver=4.0.7
pkgrel=1
pkgdesc="Library for automatically resizing contiguous memory (arrays and strings)"
arch=('i686' 'x86_64')
url="http://mmottl.github.io/${_pkgname}/"
license=('LGPL')
depends=('ocaml')
makedepends=('ocaml-findlib')
source=("https://github.com/mmottl/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('4c5f30d1fcaced42df03c858b2be5c3a')
options=(!strip)

build() {
  cd "$srcdir/res-$pkgver"

  ./configure --disable-debug --prefix /usr --destdir "$pkgdir"
   make all
}

package(){
  cd "$srcdir/res-$pkgver"

  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make install
}
