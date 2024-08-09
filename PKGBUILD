pkgname=last
pkgver=1559
pkgrel=1
pkgdesc=" Genomic aligner for short reads \
	 https://doi.org/10.1093/nar/gkq010"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib' 'bash' 'python')
url="https://gitlab.com/mcfrith/$pkgname"
source=("https://gitlab.com/mcfrith/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6c3bd30b1d9d9de06c3046b857802bb4128e518ae1119e025f80b0676576899f')
build() {
  cd $srcdir/$pkgname-$pkgver
  make all
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make install prefix=$pkgdir/usr

  cd doc
  for docu in $(ls)
do
  install -Dm644 $docu $pkgdir/usr/share/doc/$pkgname/$docu
done
}
