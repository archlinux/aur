# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=sga
pkgver=0.10.14
pkgrel=1
pkgdesc="de novo sequence assembler using string graphs"
arch=('x86_64' 'i686')
url="https://github.com/jts/sga"
license=('GPL3')
depends=('bamtools' 'jemalloc' 'python')
makedepends=('sparsehash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jts/sga/archive/v$pkgver.tar.gz"
        'set-standard.patch'
        'configure-rpath.patch')
md5sums=('211edb372898d6515dcde98d17078b7b'
         'SKIP'
         'SKIP')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 -i $srcdir/set-standard.patch
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
