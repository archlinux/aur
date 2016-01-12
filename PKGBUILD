# Maintainer: Scott Tincman <sctincman at gmail dot com>

pkgname=octopus
pkgver=5.0.1
pkgrel=1
pkgdesc="A scientific program aimed at ab initio virtual experimentation"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/"
license=('GPL')
depends=('gsl' 'lapack' 'fftw' 'perl' 'arpack')
makedepends=('gcc' 'gcc-fortran' 'libxc')
optdepends=('gd')
source=(http://www.tddft.org/programs/octopus/download/${pkgver}/octopus-${pkgver}.tar.gz)
sha256sums=('3423049729e03f25512b1b315d9d62691cd0a6bd2722c7373a61d51bfbee14e0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-newuoa --enable-openmp
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
