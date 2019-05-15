# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_js_style
pkgver=0.12.0
pkgrel=1
pkgdesc="Code style checker for Jane Street Packages"
arch=('x86_64')
url='https://github.com/janestreet/ppx_js_style'
license=('MIT')
depends=('ocaml' 'ocaml-base' 'ocaml-octavius' 'ocaml-ppxlib')
makedepends=('dune')
options=('!strip')
source=("https://ocaml.janestreet.com/ocaml-core/v$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/ppx_js_style-v${pkgver}.tar.gz")
sha512sums=('7c1323b23b20e247810b93e54b3c7ff45f4a8eecd054ac7010e5b090acc34a9a2b928398b0a668facf6904324c6d86cb217e4296326d53669c88007cfe0245b9')

build() {
  cd "${srcdir}/ppx_js_style-v${pkgver}"

  dune build
}


package() {
  cd "${srcdir}/ppx_js_style-v${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  dune install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
