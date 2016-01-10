# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=htslib
pkgver=1.3
pkgrel=1
pkgdesc="library for high-throughput sequencing data formats"
arch=('i686' 'x86_64')
url="https://github.com/samtools/htslib"
license=('custom')
depends=('zlib')
provides=('tabix')
replaces=('tabix')
conflicts=('tabix')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('39d475730a66401e4d45398c95c414f7')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver

  make check
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # htslib shared library comes installed as 0644
  chmod +x $pkgdir/usr/lib/libhts.so.*.*
}
