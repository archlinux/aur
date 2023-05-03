# Maintainer: Zhiwei Chen <condy0919@gmail.com>

_pkgname=ppx_yojson_conv_lib
pkgname=ocaml-${_pkgname}
pkgver=0.16.0
pkgrel=1
pkgdesc="Runtime lib for ppx_yojson_conv"
arch=('x86_64')
depends=('ocaml' 'ocaml-yojson>=1.7.0')
makedepends=('git' 'dune>=2.0.0')
url="https://github.com/janestreet/ppx_yojson_conv_lib"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7084306f4d28df9cadb38690a2e788ef51b20a3362d60f83b85c1a210026c0a1')
options=('!strip')
provides=('ocaml-ppx_yojson_conv_lib')
conflicts=('ocaml-ppx_yojson_conv_lib')

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

