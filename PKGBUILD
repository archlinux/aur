# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=libvdwxc
pkgver=0.4.0
pkgrel=2
pkgdesc="A library for vdW-DF exchange-correlation functionals"
arch=("x86_64")
url="https://libvdwxc.org/"
license=('GPL')
depends=('fftw')
makedepends=('gcc-fortran')
source=("https://gitlab.com/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('5fcd37253489931b94ce865bb4e6942250665e269057a50bd532c8697ac19dc7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -if
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
              --prefix=/usr \
              --with-fftw3 \
              --with-mpi
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
