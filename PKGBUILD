# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=scorep
pkgver=1.4
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cube-perf' 'openmpi' 'otf2' 'opari2')
source=(http://www.vi-hps.org/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('5aea032bb4aab3a58da3157071e1881e8044047e')

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
