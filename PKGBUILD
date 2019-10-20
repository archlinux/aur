# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=fstar
pkgver=0.9.7.0
_subver=-alpha1
pkgrel=2
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('i686' 'x86_64')
depends=('z3-git')
makedepends=('ocaml>=4.03' 'ocaml-findlib' 'ocaml-num' 'ocaml-batteries' 'ocaml-stdint' 'zarith' 'ocaml-yojson' 'ocaml-fileutils' 'ocaml-pprint' 'ocaml-menhir' 'ulex-git' 'ocaml-migrate-parsetree' 'ocaml-ppx_deriving' 'ocaml-ppx_deriving_yojson' 'ocaml-process')
provides=('fstar')
conflicts=('fstar-bin' 'fstar-git')
source=("https://github.com/FStarLang/FStar/archive/v$pkgver$_subver.zip"
        fix-ocaml-4.08.patch)
md5sums=('754ecb3d2f6c234c78537707a87e6db2'
         '1bbf449622e26f6ea2d414b6d9866e52')

prepare() {
  cd "FStar-$pkgver$_subver"

  patch -Np1 -i ../fix-ocaml-4.08.patch
}

build() {
  cd "FStar-$pkgver$_subver"

  # Step 3. Building F* from the OCaml snapshot
  make -C src/ocaml-output -j 3
}

package() {
  cd "FStar-$pkgver$_subver"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r * $pkgdir/opt/fstar
  ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
}
