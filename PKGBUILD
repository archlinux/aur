# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Chris Perl <chris.perl@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>

pkgname=ocaml-res
pkgver=5.0.0
pkgrel=1
pkgdesc="Library for automatically resizing contiguous memory (arrays and strings)"
arch=('i686' 'x86_64')
url="http://mmottl.github.io/res/"
license=('custom:LGPL2.1 with linking exception')
depends=('ocaml')
makedepends=('dune')
options=('!strip')
source=("https://github.com/mmottl/res/releases/download/${pkgver}/res-${pkgver}.tbz")
md5sums=('895530e42bc39b3502bba1d90d83dc8e')

build() {
  cd "${srcdir}/res-${pkgver}"

  jbuilder build
}

package(){
  cd "${srcdir}/res-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind -printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind -printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
