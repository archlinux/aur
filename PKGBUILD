# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=scorep
pkgver=3.1
pkgrel=1
pkgdesc="Highly scalable and easy-to-use tool suite for profiling, event tracing, and online analysis of HPC applications."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
depends=('cube-perf' 'openmpi' 'otf2' 'opari2')
source=(http://www.vi-hps.org/upload/packages/$pkgname/$pkgname-$pkgver.tar.gz gcc8.patch)
sha1sums=('54680084955ec8190632f89f508643488a95e4cc' 'f5bf07a4571729a0679d6ab2f9e6e0c7138b88d1')

prepare() {
 cd $srcdir/$pkgname-$pkgver
 patch -Np1 -i "${srcdir}/gcc8.patch"
}

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
