# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=mrbayes-mpi
pkgver=3.2.5
pkgrel=1
pkgdesc="Bayesian inference and model choice across a wide range of phylogenetic and evolutionary models"
arch=('i686' 'x86_64')
url="http://mrbayes.sourceforge.net/index.php"
license=('GPL2')
depends=('openmpi')
conflicts=(mrbayes)
provides=(mrbayes)
source=("http://downloads.sourceforge.net/mrbayes/mrbayes-$pkgver.tar.gz")
md5sums=('cbd21bf0497429dd9a912c28ce78812a')

prepare() {
  cd $srcdir/src

  autoconf
}

build() {
  cd $srcdir/src

  ./configure --prefix=/usr --without-beagle --enable-mpi

  make
}

package() {
  cd $srcdir/src

  mkdir -p $pkgdir/usr/bin

  make BINDIR=$pkgdir/usr/bin install
}
