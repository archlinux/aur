# Maintainer: Scott Tincman <sctincman at gmail dot com>

pkgname=octopus
pkgver=6.0
pkgrel=2
pkgdesc="A scientific program aimed at ab initio virtual experimentation"
arch=('i686' 'x86_64')
url="http://www.tddft.org/programs/octopus/"
license=('GPL')
depends=('gsl' 'fftw' 'arpack' 'libxc' 'gd' 'libyaml')
makedepends=('gcc' 'gcc-fortran')
source=(http://www.tddft.org/programs/octopus/download/${pkgver}/octopus-${pkgver}.tar.gz)
sha256sums=('4a802ee86c1e06846aa7fa317bd2216c6170871632c9e03d020d7970a08a8198')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --enable-newuoa --enable-openmp --disable-internal-libyaml
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # This yaml.h file is still copied regardless...
  rm ${pkgdir}/usr/include/yaml.h
}
