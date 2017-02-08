# Maintainer: William J. Bowman <aur@williamjbowman.com>

# via Contributer pmates:
# For users having problems installing this, I recommend rebuilding several of the dependencies using the following modifications:
# - when building camlp5-transitional add "options=('staticlibs')" to the PKGBUILD file
# - when building coq edit the PKGBUILD file to use the 'usecamlp5' flag instead of 'usecamlp4'
# - when building ssreflect modify the download location, as mentioned by daoo, and if you have coq 8.4pl4-1 you will have to remove the coq>=8.4 dependency since makepkg gets confused.

pkgname=ssreflect
pkgver=1.6.1
pkgrel=4
pkgdesc="The ssreflect unit of the mathematical components library for Coq."
url="https://math-comp.github.io/math-comp/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq>=8.5' 'ocaml-findlib') # Works with 8.4pl6, 8.5pl3, and 8.6.0 but don't quite know how to say that
makedepends=('camlp5-transitional>=6.12')
source=(mathcomp-$pkgver.tar.gz::https://github.com/math-comp/math-comp/tarball/mathcomp-$pkgver)
sha256sums=('b36883f87bcfdf6e9bfd4ded69c4a1215ff93b0421fabae8c852ccba15043801')
sha512sums=('bdafa1445483e5028796e9e9a0c63ecd248f3ac385e3003403f5749fb6454bed2084e75f1982a474f17d7f45ca4a4894ee9f7a4cd708d1fa980639f2e4c1e548')

build() {
  cd $srcdir/math-comp-math-comp-*/mathcomp/$pkgname

  # Per recommendations from README, use -j 3
  make -j 3
}

package(){
  cd $srcdir/math-comp-math-comp-*/mathcomp/$pkgname
  make DSTROOT=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}
