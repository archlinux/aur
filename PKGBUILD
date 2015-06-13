# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=htslib
pkgver=1.2.1
pkgrel=2
pkgdesc="library for high-throughput sequencing data formats"
arch=('i686' 'x86_64')
url="https://github.com/samtools/htslib"
license=('custom')
depends=('zlib')
provides=('tabix')
replaces=('tabix')
conflicts=('tabix')
source=($pkgname-$pkgver.tar.gz::https://github.com/samtools/htslib/archive/$pkgver.tar.gz)
md5sums=('81f5f1aa17a188a6b6250ca67d83384d')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  autoreconf -i
}

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
  chmod +x $pkgdir/usr/lib/libhts.so.*.*.*
}
