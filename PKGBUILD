# Maintainer: Thomas Letan <lthms@soap.coffee>

# Note about Make and parallelism:
# We disable Make parallelism with -j1 because it looks like enabling it
# does not play well with Dune.

pkgname=spatial-shell
pkgver=7
pkgrel=1
pkgdesc='Implementing a spatial model inspired by Material Shell, for i3 and sway.'
url=https://github.com/lthms/spatial-shell
license=('MPL2')
arch=('x86_64')
optdepends=(
  'sway'
  'i3-wm'
  'waybar'
)
makedepends=(
  'opam'
  'scdoc'
  'ocaml-ezjsonm-encoding'
  'ocaml-poll'
  'ocaml-cmdliner'
)
source=(
  "$pkgname-$pkgver.tbz::https://github.com/lthms/spatial-shell/releases/download/$pkgver/spatial-shell-$pkgver.tbz"
)
sha512sums=(
  '4e433ee1c1d8a7ec6bb548e356452d04e5add32a8ecad0f15c221f48337d0136adebdd983266260a5626542220cb7ef1c5f1991199a79c7ada03a44f15f39199'
)

build() {
  cd "${srcdir}/$pkgname-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/usr" install
}
