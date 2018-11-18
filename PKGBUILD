# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.3.5
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
sha512sums=('346a90a5ceb42459e28f483977d3a41533ab4b5bc4169a9cdfffd22b1d506240104621b831280995749b8982c53a4a533a06afca08ba58065d04263a13ec32c3')

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
