# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=fstar
pkgver=0.9.5.0
pkgrel=2
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('i686' 'x86_64')
depends=('z3-git')
makedepends=('ocaml>=4.03' 'ocaml-findlib' 'ocaml-batteries' 'ocaml-stdint' 'zarith' 'ocaml-yojson' 'ocaml-fileutils' 'ocaml-pprint' 'ocaml-menhir')
provides=('fstar')
conflicts=('fstar-bin' 'fstar-git')
source=("https://github.com/FStarLang/FStar/archive/v$pkgver.zip")
md5sums=('07e8de1d8dcfe3c62774c3e141fd9382')

build() {
  cd "FStar-$pkgver"

  # Step 3. Building F* from the OCaml snapshot
  make -C src/ocaml-output -j 3
}

package() {
  cd "FStar-$pkgver"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r * $pkgdir/opt/fstar
  ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
}
