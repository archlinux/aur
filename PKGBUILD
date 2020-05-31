# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Sergey Plaksin <serp256@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ocaml-menhir-compcert
_basepkgname=${pkgname%-*}
pkgver=20200211
pkgrel=1
pkgdesc="Latest version of Menhir that can build the latest CompCert release."
arch=("i686" "x86_64")
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('GPL' 'QPL')
depends=('ocaml>=4.02')
makedepends=('ocamlbuild' 'ocaml-findlib' 'dune')
provides=($_basepkgname=$pkgver)
conflicts=($_basepkgname)
options=(!strip !makeflags)
source=("https://gitlab.inria.fr/fpottier/menhir/-/archive/$pkgver/menhir-$pkgver.tar.gz")
sha256sums=('00f677401a92d91568a4faffb4977ab71a32a265de59e35419ad5b705d4a532d')

build() {
  cd "$srcdir/${_basepkgname/ocaml-/}-$pkgver"

  dune build
}

package() {
  cd "$srcdir/${_basepkgname/ocaml-/}-$pkgver"
  dune install --prefix "${pkgdir}/usr" \
       --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}
