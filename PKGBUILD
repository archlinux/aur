# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Contributor: Bertram Felgenhauer <int-e@gmx.de>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=camlidl
pkgver=1.06
_pkgver=${pkgver/\./}
pkgrel=4
pkgdesc="A stub code generator and COM binding for Objective Caml (OCaml)"
arch=('i686' 'x86_64')
url="https://github.com/xavierleroy/camlidl"
license=('custom')
depends=('ocaml')
options=(staticlibs)
source=("https://github.com/xavierleroy/$pkgname/archive/$pkgname$_pkgver.tar.gz"
        META.camlidl)

build() {
  cd "$srcdir/$pkgname-$pkgname$_pkgver"
  cp config/Makefile.unix config/Makefile
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgname$_pkgver"

  local _bindir="$pkgdir/usr/bin"
  local _ocamldir="$pkgdir/$(ocamlc -where)"
  mkdir -p "$_bindir" "$_ocamldir"/{caml,stublibs,"$pkgname"}

  make BINDIR="$_bindir" OCAMLLIB="$_ocamldir" install

  install -Dm644 "$srcdir/META.camlidl" "$_ocamldir/$pkgname/META"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha1sums=('674c75608faa841caea5a3d3c75dc8ff58d5c5a4'
          'aeaa511cd2e98e312182cb49da3ecc8da8d72e76')
sha256sums=('abf490f1b07f23ed8c9f050475832436c56db22c40083c87f89cb5d4250cf12a'
            'ed7c8db53b950f62bfe3d1f99081a42787f7b17358dcdcc0e842daacdd5c70b2')
