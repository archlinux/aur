# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=libint
pkgver=1.2.1
pkgrel=1
pkgdesc="High-performance library for computing Gaussian integrals"
arch=('x86_64')
url="https://github.com/evaleev/libint"
license=('GPL')
depends=('mpfr' 'boost-libs')
makedepends=('cmake')
source=(https://github.com/evaleev/libint/archive/release-1-2-1.tar.gz)
sha256sums=('fe5900c98d6adfeadb69cecee9895548ef69b5464f9c2cfb85bd315cf349f3a4')

prepare() {
  mv $srcdir/$pkgname-release* $srcdir/$pkgname-$pkgver
  mkdir $srcdir/$pkgname-$pkgver/build  
}

build() {
  cd $srcdir/$pkgname-$pkgver/build
  cmake .. \
        -DMERGE_LIBDERIV_INCLUDEDIR=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd ${srcdir}/$pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
