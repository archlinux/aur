# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=cd-hit
pkgver=4.6.5
_pkgver="v$pkgver-2016-0304"
pkgrel=1
pkgdesc="clustering DNA/protein sequence database at high identity with tolerance"
arch=('i686' 'x86_64')
url="http://weizhongli-lab.org/cd-hit/"
license=('GPL2')
depends=('perl')
source=("https://github.com/weizhongli/cdhit/releases/download/V$pkgver/cd-hit-$_pkgver.tar.gz"
        "perl-shebangs.patch::https://patch-diff.githubusercontent.com/raw/weizhongli/cdhit/pull/25.patch")
md5sums=('fabe71cabf963591cf6e0b9458f88f7f'
         '921ad2a919b3be7a9d3a629f98469b72')

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
