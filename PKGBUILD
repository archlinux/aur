# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <archlinux at bitsofnetworks dot org>

pkgname=ocaml4-num
pkgver=1.4
pkgrel=5
pkgdesc="Library for arbitrary-precision integer and rational arithmetic that used to be part of the OCaml core distribution"
arch=(x86_64)
url="https://github.com/ocaml/num"
license=(LGPL-2.1-only)
depends=(ocaml4)
makedepends=(ocaml4-findlib)
conflicts=(ocaml-num)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ocaml/num/archive/v${pkgver}.tar.gz")
sha512sums=('0cc9be8ad95704bb683b4bf6698bada1ee9a40dc05924b72adc7b969685c33eeb68ccf174cc09f6a228c48c18fe94af06f28bebc086a24973a066da620db8e6f')
options=(!strip !makeflags !lto)

build() {
  cd "${srcdir}/num-${pkgver}"
  make
}

package() {
  cd "${srcdir}/num-${pkgver}"
  local _destdir="${pkgdir}$(ocamlfind printconf destdir)"
  install -d "${_destdir}/stublibs"

  make OCAMLFIND_DESTDIR="${_destdir}" findlib-install
}
