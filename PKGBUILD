# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Magnus Therning <magnus@therning.org>

pkgname=ocaml-pcre
pkgver=7.3.4
pkgrel=1
pkgdesc="Perl compatible regular expressions for OCaml"
arch=('i686' 'x86_64' 'armv7h')
url="http://mmottl.github.io/pcre-ocaml"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml' 'pcre')
makedepends=('dune' 'ocaml-base' 'ocaml-stdio' 'ocaml-configurator')
replaces=('pcre-ocaml')
conflicts=('pcre-ocaml')
options=('!strip' 'staticlibs')
source=("https://github.com/mmottl/pcre-ocaml/releases/download/${pkgver}/pcre-${pkgver}.tbz")
md5sums=('fc7b7b092c38bdbdb0b679ff3af2ff68')

build() {
  cd "${srcdir}/pcre-${pkgver}"

  jbuilder build
}

package() {
  cd "${srcdir}/pcre-${pkgver}"

  install -dm755 "${pkgdir}/$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
