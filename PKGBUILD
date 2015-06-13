# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=sga
pkgver=0.10.13
pkgrel=1
pkgdesc="de novo sequence assembler using string graphs"
arch=('x86_64' 'i686')
url="https://github.com/jts/sga"
license=('GPL3')
depends=('bamtools' 'jemalloc' 'python')
makedepends=('sparsehash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jts/sga/archive/v$pkgver.tar.gz"
        'configure-rpath.patch')
md5sums=('d4f6aefc48c940dba96cc6513649ecdd'
         'SKIP')

prepare() {
  cd $srcdir/$pkgname-$pkgver/src

  patch -p0 -i $srcdir/configure-rpath.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver/src

  ./autogen.sh
  ./configure --prefix=/usr --with-bamtools=/usr --with-jemalloc=/usr

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/src

  make DESTDIR=$pkgdir install
}
