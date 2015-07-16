# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=raxml
pkgver=8.2.0
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
md5sums=('c0462dd734e57b8f007df60067add6ec'
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
