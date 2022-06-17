# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_pkgname=ocp-indent
pkgname=ocaml-${_pkgname}
pkgver=1.8.2
pkgrel=2
pkgdesc="Indentation tool for OCaml, to be used from editors like Emacs and Vim."
arch=('x86_64')
depends=('ocaml' 'ocaml-findlib' 'ocaml-cmdliner>=1.0.0')
makedepends=('git' 'dune>=1.0')
url="https://github.com/OCamlPro/ocp-indent"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('013069cf0b2219593351077e7eb11379879310e7e3e09f4f1c399bb40f24388f')
options=('!strip')
provides=('ocaml-ocp-indent')
conflicts=('ocaml-ocp-indent')

build() {
  cd "${_pkgname}-${pkgver}"

  dune build
}

package() {
  cd "${_pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" dune install --prefix="/usr" --libdir="/usr/lib/ocaml"

  # Dune installs documentation in /usr/doc, fix that.
  install -dm755 "${pkgdir}/usr/share/"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"

  rm "${pkgdir}"/usr/lib/ocaml/${_pkgname}/dune-package
}

