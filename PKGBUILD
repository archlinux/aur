# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=libvdwxc
pkgver=0.4.0
pkgrel=1
pkgdesc="A library for vdW-DF exchange-correlation functionals"
arch=("x86_64")
url="https://libvdwxc.org/"
license=('GPL')
depends=('fftw-mpi')
makedepends=('gcc-fortran')
source=("https://gitlab.com/$pkgname/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('5fcd37253489931b94ce865bb4e6942250665e269057a50bd532c8697ac19dc7')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -if
}

build() {
    cd $pkgname-$pkgver
    ./configure \
                --prefix=/usr \
                --with-fftw3 \
                --with-mpi
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}
