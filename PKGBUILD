# Maintainer: oliver <at> first . in - berlin . de

pkgname=ocaml-xml-light
pkgver=2.2
pkgrel=4
license=('LGPL')
arch=('i686' 'x86_64')
pkgdesc="Objective Caml lightweight xml parser"
url="http://tech.motion-twin.com/xmllight.html"
depends=('ocaml')
makedepends=('ocaml-findlib')
options=('!strip' '!makeflags' 'staticlibs')
source=("http://tech.motion-twin.com/zip/xml-light-${pkgver}.zip"
        "META")
md5sums=('7658985cfdaeeb94b579b932eeaa3e00'
         'ad22cde4d3a944673d3b0a25a1e835dc')

OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
DOCDIR="${pkgdir}/usr/share/doc/${pkgname}"

build() {
cd ${srcdir}/xml-light
make all doc
make opt
}

package() {
cd ${srcdir}/xml-light
mkdir -p ${pkgdir}$(ocamlfind printconf destdir)
mkdir -p ${pkgdir}/usr/share/doc/${pkgname}
rm -rf test.cmi
cp ${srcdir}/META .
env DESTDIR="${pkgdir}" \
OCAMLFIND_DESTDIR=${pkgdir}$(ocamlfind printconf destdir) \
ocamlfind install xml-light META *.mli *.cmi *.cma *.a *.cmxa *.cmx
cp doc/* ${pkgdir}/usr/share/doc/${pkgname}
}
