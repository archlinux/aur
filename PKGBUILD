pkgname=last
pkgver=1541
pkgrel=2
pkgdesc=" Genomic aligner for short reads \
	 https://doi.org/10.1093/nar/gkq010"
arch=('x86_64')
license=('GPL-3.0-only')
depends=('zlib' 'bash' 'python')
url="https://gitlab.com/mcfrith/$pkgname"
source=("https://gitlab.com/mcfrith/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('88c8401da6cca51261f7ab69c2113a3ffc42fc6ea2efe9dc96b55d23cdefc7b4')
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
