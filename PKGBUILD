# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Contributor: Bertram Felgenhauer <int-e@gmx.de>
# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=camlidl
pkgver=1.06
_pkgver=${pkgver/\./}
pkgrel=2
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
          '2e26acb071e62574ced84ff7aa3a7164e27daef0')
sha256sums=('abf490f1b07f23ed8c9f050475832436c56db22c40083c87f89cb5d4250cf12a'
            '1a060499f884670ad3ad5f9dbd8421ea3754947b0ee955424490848acb39ce42')
