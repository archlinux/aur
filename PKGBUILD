# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=raxml-mpi
pkgver=8.1.17
pkgrel=1
pkgdesc="Randomized Axelerated Maximum Likelihood"
arch=('i686' 'x86_64')
url="http://sco.h-its.org/exelixis/web/software/raxml/"
license=('GPL3')
depends=('openmpi')
conflicts=(raxml)
provides=(raxml)
install='raxml.install'
source=("raxml-$pkgver.tar.gz::https://github.com/stamatak/standard-RAxML/archive/v$pkgver.tar.gz"
        'raxml.install')
md5sums=('39868f09d25c9f2d5013f5172e48a172'
         '8192c20ff65d4cce74568e4d20aceed2')

build() {
  cd $srcdir/standard-RAxML-$pkgver

  for f in Makefile*gcc ; do
    rm -f *.o
    make -f $f || true
  done
}

package() {
  cd $srcdir/standard-RAxML-$pkgver

  for f in raxml* ; do
    install -Dm755 $f $pkgdir/usr/bin/$(basename $f)
  done

  for perlscript in usefulScripts/*.pl ; do
    install -Dm755 $perlscript $pkgdir/usr/bin/$(basename $perlscript .pl)
  done

  for shellscript in usefulScripts/*.sh ; do
    install -Dm755 $shellscript $pkgdir/usr/bin/$(basename $shellscript .sh)
  done
}
