# Maintainer: Scott Tincman <sctincman at gmail dot com>

pkgname=octopus
pkgver=4.1.2
pkgrel=2
pkgdesc="A scientific program aimed at ab initio virtual experimentation"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/"
license=('GPL')
depends=('gsl' 'lapack' 'fftw' 'perl' 'arpack')
makedepends=('gcc' 'gcc-fortran' 'libxc')
optdepends=('libcl' 'gd')
source=(http://www.tddft.org/programs/octopus/download/${pkgver}/octopus-${pkgver}.tar.gz)
sha256sums=('c43ac301ff035caee667292841c5d9f166da986634cf2623e3f5a8aa86fe7a69')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  FCCPP='/usr/bin/cpp -P -ansi' ./configure --prefix=/usr --enable-newuoa --enable-openmp --enable-opencl
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
