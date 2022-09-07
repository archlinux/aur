# Maintainer: Lance Roy <ldr709@gmail.com>
#
# Previously maintained by Jakob Gahde <j5lx@fmail.co.uk>

_projectname='spawn'
pkgname="ocaml-$_projectname"
pkgver=0.15.1
pkgrel=1
pkgdesc="A small library for spawning sub-processes"
arch=('x86_64')
url="https://github.com/janestreet/$_projectname"
license=('MIT')
depends=(
	'ocaml'
	'ocaml-ppx_expect'
	'ocaml-ppx_bench'
	)
makedepends=('dune')
options=('!strip')
source=("$pkgname-$epoch:$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('efdb31d5ec5ea36d0bc80224d4ee04e46ce3428d1662870e6cebece92bc313d6eebee378802c0c059dd6e0cafea515308c31b7dfaf04a098eb4566583c1e9ed4')

build() {
  cd "${srcdir}/spawn-${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/spawn-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
