pkgname=sollya
pkgver=8.0
pkgrel=1

pkgdesc="A tool environment and a library for safe floating-point code development"
arch=('any')
url="https://gitlab.inria.fr/sollya/sollya/"
license=('CeCILL-C')

depends=('gmp' 'mpfr' 'mpfi' 'libxml2' 'fplll')
optdepends=(
  'gnuplot: for using the plot and externalplot commands'
)
source=("https://www.sollya.org/releases/sollya-8.0/sollya-8.0.tar.gz")
md5sums=('f8446e5222d9b55368b7ee203c8951cd')
build() {
  cd "$pkgname-$pkgver"

  # Fix build with bison >= 3.8
  sed -i 's/extern int miniyyparse();/extern int miniyyparse(void *myScanner);/' execute.h
  sed -i 's/void blockSignalsCounted()/void blockSignalsCounted(int nointeract)/' signalhandling.h

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
