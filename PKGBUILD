# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Robert Schwarz <mail@rschwarz.net>

pkgname=geosteiner
pkgver=5.0.1
pkgrel=1
pkgdesc="Compute Euclidean and Rectilinear Steiner Trees"
arch=(i686 x86_64)
url="http://www.geosteiner.com/"
license=(custom)
source=("http://www.geosteiner.com/geosteiner-$pkgver.tar.gz")
md5sums=('12dfdd602a1944ae70ddff48c992e2bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  TARGETS=(bb dumpfst efst fst2graph lib_points plotfst prunefst rand_points rfst smt ufst analyze_ckpt demo1 demo2 demo3 demo4 hgmst merge_ckpt)
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
