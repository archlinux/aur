# Maintainer: schuay <jakob.gruber@gmail.com>

pkgname=cilk
pkgver=5.4.6
pkgrel=3
pkgdesc='General-purpose programming language designed for multithreaded parallel computing.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://supertech.csail.mit.edu/cilk/'
depends=('gcc' 'glibc')
options=('!makeflags' 'staticlibs' '!libtool')
source=("http://supertech.csail.mit.edu/cilk/${pkgname}-${pkgver}.tar.gz")
md5sums=('8ee528dee8072d158687560735a8d15b')
 
build() {
  cd $srcdir/$pkgname-$pkgver

  # See https://groups.google.com/forum/?fromgroups=#!topic/comp.os.linux.development.apps/UiqFsaH69Aw
  CFLAGS='-O2' ./configure CFLAGS="-O2 -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=200809L" \
      CC="gcc -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=200809L" --prefix=/usr

  make
}

check() {
  cd $srcdir/$pkgname-$pkgver
  make check
}
 
package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}
