# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.4.3
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
sha512sums=('917e98aa86a75d2e17b0df9eb546c5dc568eacd0f2df0c5621467246142beff449e11544d88bc42eabf1cc288f7aa19aaebe90283ca8cf72dc023e52c6c21e02')

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
