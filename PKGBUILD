# Maintainer: Robert Schwarz <mail@rschwarz.net>
pkgname=geosteiner
pkgver=3.1
pkgrel=3
pkgdesc="Compute Euclidean and Rectilinear Steiner Trees"
arch=(i686 x86_64)
url="http://www.diku.dk/hjemmesider/ansatte/martinz/geosteiner/"
license=(custom)
depends=(glibc)
source=(http://www.cs.sunysb.edu/~algorith/implement/geosteiner/distrib/$pkgname-$pkgver.tar.gz)
md5sums=(89bf30c923aa2bc61c04906c52cb6780)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  TARGETS=(bb dumpfst efst fst2graph kr lib_points plotfst prunefst rand_points rfst)
  for i in ${TARGETS[@]}; do
      install -c -m 755 $i $pkgdir/usr/bin
  done

  mkdir -p $pkgdir/usr/share/$pkgname
  DOCS=(README INSTALL prelude.ps)
  for i in ${DOCS[@]}; do
      install -c -m 644 $i $pkgdir/usr/share/$pkgname
  done

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -c -m 644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}
