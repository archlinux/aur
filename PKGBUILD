# Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=mathcomp
pkgver=1.6.4
pkgrel=1
pkgdesc="The entire mathematical components library for Coq."
url="https://math-comp.github.io/math-comp/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('coq>=8.5') # Works with 8.4pl6, 8.5pl3, 8.6.0, and 8.7 but don't quite know how to say that
source=(mathcomp-$pkgver.tar.gz::https://github.com/math-comp/math-comp/tarball/mathcomp-$pkgver)
sha256sums=('8595c208ed1f5589552de498ef2c043b577228bd3c048775fa51cea90c603adb')
sha512sums=('972cbaf36653ea30c77c876095bac8aa779b36fa18f0c7f753933569fe8e9663cd57c1b4e49cbe5cbdb1cadf1415b57426d4ecbe318d1e24b2a3b5966fe194a6')

build() {
  cd $srcdir/math-comp-math-comp-*/$pkgname

  # Per recommendations from README, use -j 3
  make -j 3
}

package(){
  cd $srcdir/math-comp-math-comp-*/$pkgname
  make DSTROOT="${pkgdir}" 'COQLIB:=$(DSTROOT)/$(shell coqtop -where)/' install
}

