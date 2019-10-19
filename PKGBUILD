# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=fstar-git
pkgver=20191019
pkgrel=1
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('i686' 'x86_64')
depends=('z3-git')
makedepends=('ocaml>=4.03' 'ocaml-findlib' 'ocaml-num' 'ocaml-batteries' 'ocaml-stdint' 'zarith' 'ocaml-yojson' 'ocaml-fileutils' 'ocaml-pprint' 'ocaml-menhir' 'ulex-git' 'ocaml-migrate-parsetree' 'ocaml-ppx_deriving' 'ocaml-ppx_deriving_yojson' 'ocaml-process')
provides=('fstar')
conflicts=('fstar' 'fstar-bin')
source=("${pkgname}::git://github.com/FStarLang/FStar.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

build() {
  cd "$pkgname"

  # Step 1. Building F* from sources using the F# compiler
  #make -C src
  # Step 2. Extracting the sources of F* itself to OCaml
  #make ocaml -C src
  # Step 3. Building F* from the OCaml snapshot
  make -C src/ocaml-output -j 3
}

package() {
  cd "$pkgname"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r * $pkgdir/opt/fstar
  ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
}
