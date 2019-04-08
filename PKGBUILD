# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=scorep
pkgver=5.0
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cubew' 'cubelib' 'openmpi' 'otf2' 'opari2')
source=(https://www.vi-hps.org/cms/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('afd8f9ad04b0386c3768f190cd1923f4a8d2d463')

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
