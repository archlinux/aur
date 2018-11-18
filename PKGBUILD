# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Chris Perl <chris.perl@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=ocaml-res
pkgver=5.0.1
pkgrel=1
pkgdesc="Library for automatically resizing contiguous memory (arrays and strings)"
arch=('i686' 'x86_64')
url="http://mmottl.github.io/res/"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/mmottl/res/releases/download/${pkgver}/res-${pkgver}.tbz")
sha512sums=('7c95519bfe79ed87717907c0baab86cc4fa553c8f2b1961c7c377d4673c64950448715e8bdf58692f325f48a3b4d37e7435dfe4579c90931abfde33ec0f0bf8a')

build() {
  cd "${srcdir}/res-${pkgver}"

  dune build
}

package(){
  cd "${srcdir}/res-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
