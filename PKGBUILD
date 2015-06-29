# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=scorep
pkgver=1.4.2
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cube-perf' 'openmpi' 'otf2' 'opari2')
source=(http://www.vi-hps.org/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('bd792ba590ca25e37bc0bca1a3b927e7ca4e98e6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-mpi=openmpi --with-shmem=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
