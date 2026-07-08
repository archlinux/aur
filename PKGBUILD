pkgname=last
pkgver=1652
pkgrel=1
pkgdesc=" Genomic aligner for short reads \
	 https://doi.org/10.1093/nar/gkq010"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib' 'bash' 'python')
url="https://gitlab.com/mcfrith/$pkgname"
source=("https://gitlab.com/mcfrith/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('cd21b0124e9d1594ac13b7e5a7325e23bd48009ed36dca34493b583e4d46f060')
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
