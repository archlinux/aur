# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=cd-hit
pkgver=4.8.1
_pkgver="v$pkgver-2019-0228"
pkgrel=1
pkgdesc="clustering DNA/protein sequence database at high identity with tolerance"
arch=('i686' 'x86_64')
url="http://weizhongli-lab.org/cd-hit/"
license=('GPL2')
depends=('perl')
source=("https://github.com/weizhongli/cdhit/releases/download/V$pkgver/cd-hit-$_pkgver.tar.gz"
        "perl-shebangs.patch::https://patch-diff.githubusercontent.com/raw/weizhongli/cdhit/pull/25.patch")
sha512sums=('e01247d20c7f4035ea775e4b27a4ab1d34acdcce17cf01c2fe08a2478220655266c2a25149cecb9aa987d2b43bd6530e2e846b2781c373d12fd493fc89a575e6'
            'f9a918ebe2865d84c31fbd5ab4b0b2f58bf3faee879cb304e1fa44969e01db3786f12b3699a712094f9ee261efd306188aff548b1a88f57daae5d02205551236')

prepare() {
  cd $srcdir/cd-hit-$_pkgver

  patch -Np1 -i $srcdir/perl-shebangs.patch
}

build() {
  cd $srcdir/cd-hit-$_pkgver

  make openmp=yes
}

package() {
  cd $srcdir/cd-hit-$_pkgver

  for file in cd-hit cd-hit-est cd-hit-2d cd-hit-est-2d cd-hit-div cd-hit-454 *.pl ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file .pl)
  done
}
