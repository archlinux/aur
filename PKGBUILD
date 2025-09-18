pkgname=last
pkgver=1645
pkgrel=1
pkgdesc=" Genomic aligner for short reads \
	 https://doi.org/10.1093/nar/gkq010"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib' 'bash' 'python')
url="https://gitlab.com/mcfrith/$pkgname"
source=("https://gitlab.com/mcfrith/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d40b9ce842cd0485ec825db85b7fba617a39a5c09e22b3692b2325976807354d')
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
