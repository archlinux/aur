# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: Mort Yao <soi@mort.ninja>
# Contributor: Serge Zirukin <ftrvxmtrx@gmail.com>
# Contributor: Sergei Lebedev <superbobry@gmail.com>
# Contributor: Guillem Rieu <guillemr@gmx.net>
# Contributor: Sergey Plaksin <serp256@gmail.com>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>

pkgname=ocaml-menhir-compcert
_basepkgname=${pkgname%-*}
pkgver=20210419
pkgrel=1
pkgdesc="Latest version of Menhir that can build the latest CompCert release."
arch=("i686" "x86_64")
url="http://cristal.inria.fr/~fpottier/menhir/"
license=('GPL' 'custom:QPL')
depends=('ocaml>=4.02.3')
makedepends=('dune>=2.0')
provides=($_basepkgname=$pkgver)
conflicts=($_basepkgname)
options=(!strip !makeflags)
source=("https://gitlab.inria.fr/fpottier/menhir/-/archive/$pkgver/menhir-$pkgver.tar.gz")
sha256sums=('6b75a92276f1cdc8f1ea5030adad344a10bfce9077de274f621f5ef2c3428920')

build() {
  cd "$srcdir/${_basepkgname/ocaml-/}-$pkgver"
  dune build
}

package() {
  cd "$srcdir/${_basepkgname/ocaml-/}-$pkgver"
  dune install --prefix "${pkgdir}/usr" \
       --libdir "lib/ocaml" \
       --mandir "share/man"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
