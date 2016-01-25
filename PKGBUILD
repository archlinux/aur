# Maintainer: William J. Bowman <aur@williamjbowman.com>

# via Contributer pmates: 
# For users having problems installing this, I recommend rebuilding several of the dependencies using the following modifications:
# - when building camlp5-transitional add "options=('staticlibs')" to the PKGBUILD file
# - when building coq edit the PKGBUILD file to use the 'usecamlp5' flag instead of 'usecamlp4'
# - when building ssreflect modify the download location, as mentioned by daoo, and if you have coq 8.4pl4-1 you will have to remove the coq>=8.4 dependency since makepkg gets confused. 

pkgname=ssreflect
pkgver=1.6
pkgrel=1
pkgdesc="A set of extensions to the scripting language of Coq."
url="https://math-comp.github.io/math-comp/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq=8.5') # Also works with 8.4pl6 but don't quite know how to say that
makedepends=('camlp5-transitional>=6.12')
source=(mathcomp-$pkgver.tar.gz::https://github.com/math-comp/math-comp/tarball/mathcomp-$pkgver)
sha256sums=('19c5b5b872f50f8b055b86ea3d42692549813b0ebf1ebc6cfa1f05c8892a1bea')
sha512sums=('b98e82fc39f44c2c885b739a1693c403278912703910efb54bca27096581074b5e11742a41e48b4923b515b549c3290a26b1d43b8dae0c2b56f85d40f56f5a4b')

build() {
  cd $srcdir/math-comp-math-comp-52a8679/mathcomp/$pkgname

  # SSReflect requires *a lot* of memory to build. It can be a good
  # idea add -j1 to the following command to force a sequential build.
  make
}

package(){
  cd $srcdir/math-comp-math-comp-52a8679/mathcomp/$pkgname
  make DSTROOT=$pkgdir 'COQLIB:=$(DESTDIR)/$(shell coqtop -where)/' install
}

