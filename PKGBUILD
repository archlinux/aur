# Maintainer Anton Kudelin <kudelin at protonmail dot com>

pkgname=libxsmm
pkgver=1.12
pkgrel=1
arch=('x86_64')
pkgdesc="A library for small dense and small sparse matrix-matrix multiplications"
url="https://github.com/hfp/libxsmm"
license=('BSD')
depends=('gcc-libs')
makedepends=('gcc' 'gcc-fortran')
checkdepends=('blas' 'lapack')
conflicts=('libxsmm-git')
source=($url/archive/$pkgver.tar.gz)
sha256sums=('37432fae4404ca12d8c5a205bfec7f9326c2d607d9ec37680f42dae60b52382a')

prepare() {
  export CTARGET="$CFLAGS"
  export STATIC=0
  export OMP=1
  export MKL=0
  export PREFIX=/usr
  export DESTDIR=$pkgdir
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

check() {
  cd $srcdir/$pkgname-$pkgver
  make tests
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install
  find $pkgdir -name "*pc" -print0 | xargs -0 sed -i "s#$pkgdir##g"
}
