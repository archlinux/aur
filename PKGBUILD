# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.4.1
pkgrel=1
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('i686' 'x86_64' 'armv7h')
url="http://mmottl.github.io/pcre-ocaml"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'pcre')
makedepends=('dune' 'ocaml-base')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/pcre-ocaml/releases/download/${pkgver}/pcre-${pkgver}.tbz")
sha512sums=('621c02db6989148733ae8c5ed566eafde201d367deb986231a33ad3a9409ec457f2d6161c4d6b0b595e951559941029efcb859056168b513f6a0b79f8bd8680a')

build() {
  cd "${srcdir}/pcre-${pkgver}"

  dune build
}

package() {
  cd "${srcdir}/pcre-${pkgver}"

  install -dm755 "${pkgdir}/$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
