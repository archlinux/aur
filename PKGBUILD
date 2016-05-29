# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=htslib
pkgver=1.3.1
pkgrel=1
pkgdesc="library for high-throughput sequencing data formats"
arch=('i686' 'x86_64')
url="https://github.com/samtools/htslib"
license=('custom')
depends=('curl')
provides=('tabix')
replaces=('tabix')
conflicts=('tabix')
source=(https://github.com/samtools/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('16d78f90b72f29971b042e8da8be6843')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-libcurl \
    --enable-plugins \
    --with-plugin-dir=/usr/lib/htslib/plugins

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
