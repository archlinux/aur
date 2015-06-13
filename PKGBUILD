# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=raxml
pkgver=8.1.17
pkgrel=1
pkgdesc="Randomized Axelerated Maximum Likelihood"
arch=('i686' 'x86_64')
url="http://sco.h-its.org/exelixis/web/software/raxml/"
license=('GPL3')
depends=('bash' 'perl')
conflicts=(raxml-mpi)
install='raxml.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/stamatak/standard-RAxML/archive/v$pkgver.tar.gz"
        'raxml.install')
md5sums=('39868f09d25c9f2d5013f5172e48a172'
         '978e26acea5898ceeb9d3b1314df5213')

build() {
  cd $srcdir/standard-RAxML-$pkgver

  for f in $(ls Makefile*gcc | grep -vE "HYBRID|MPI") ; do
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
