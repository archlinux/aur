# Maintainer: oliver < a t >  first . in-berlin . de
pkgname=ocaml-camlzip
_pkgname=camlzip
pkgver=1.05
pkgrel=1
pkgdesc="Provides easy access to compressed files in ZIP, GZIP and JAR format"
arch=('i686' 'x86_64')
license=('custom: LGPL-2.1+ with OCaml linking exception')
source=(http://forge.ocamlcore.org/frs/download.php/1037/camlzip-1.05.tar.gz)
md5sums=(e85c179d5dc79821e6e8d90e636599f1)
url="http://forge.ocamlcore.org/projects/camlzip/"
depends=('ocaml')
makedepends=('ocaml' 'ocaml-findlib')
# options=(!makeflags)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  make all
  make allopt
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  INSTALLDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "$INSTALLDIR"
  chmod 755 "$INSTALLDIR"

  env DESTDIR=${pkgdir} \
    OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
    OCAMLFIND_LDCONF=ignore \
  	ocamlfind install zip META *.mli *.a *.cmi *.cma $(wildcard *.cmxa) $(wildcard *.so)

}
