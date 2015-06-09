# Contributor: oliver < a t >  first . in-berlin . de
_libname=json-wheel
pkgname=ocaml-${_libname}
pkgver=1.0.6
pkgrel=1
pkgdesc="JSON parser and writer for OCAML, with optional C-style comments"
arch=('i686' 'x86_64')
url="http://martin.jambon.free.fr/json-wheel.html"
license=('BSD')
makedepends=('ocaml-findlib' 'ocaml')
depends=('glibc')
options=('!strip' '!makeflags' 'staticlibs')
source=(http://mjambon.com/$_libname-$pkgver.tar.bz2)
md5sums=('8685ecee7a7416c77c14fbdf05c5a06e')

build(){
  cd "$srcdir/$_libname-$pkgver"
  make
}

package(){
  cd "$srcdir/$_libname-$pkgver"
  export OCAMLFIND_DESTDIR="$pkgdir$(ocamlfind printconf destdir)"

  mkdir -p ${OCAMLFIND_DESTDIR}                      # for the library
  mkdir -p ${pkgdir}/usr/bin                         # for jsoncat-binary
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/       # for documentation
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/  # for license

  env PREFIX=${pkgdir} BINDIR=${pkgdir}/usr/bin  make -d  install       # install library and binary
  install -m 0644 -t "${pkgdir}/usr/share/doc/$pkgname/" html/*         # install documentation
  install -m 0644 -t "${pkgdir}/usr/share/licenses/$pkgname/" LICENSE   # install license
}
