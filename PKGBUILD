pkgname=last
pkgver=1542
pkgrel=1
pkgdesc=" Genomic aligner for short reads \
	 https://doi.org/10.1093/nar/gkq010"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib' 'bash' 'python')
url="https://gitlab.com/mcfrith/$pkgname"
source=("https://gitlab.com/mcfrith/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f476879b194beef811d11fae61424ce0ec327fbe13ebfaa6617a1405fe9227f8')
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
