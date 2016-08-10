# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=sga
pkgver=0.10.15
pkgrel=1
pkgdesc="de novo sequence assembler using string graphs"
arch=('x86_64' 'i686')
url="https://github.com/jts/sga"
license=('GPL3')
depends=('bamtools' 'jemalloc' 'python')
makedepends=('sparsehash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jts/sga/archive/v$pkgver.tar.gz"
        'configure-rpath.patch')
md5sums=('990aed1593f8072650c6366e5cf32519'
         'SKIP')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 -i $srcdir/configure-rpath.patch

  cd src

  ./autogen.sh
}

build() {
  cd $srcdir/$pkgname-$pkgver/src

  ./configure --prefix=/usr --with-bamtools=/usr --with-jemalloc=/usr

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/src

  make DESTDIR=$pkgdir install
}
