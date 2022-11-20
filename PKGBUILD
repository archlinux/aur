# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=fleur
pkgver=6.1
pkgrel=1
pkgdesc="A full-potential linearized augmented planewave code"
arch=("x86_64")
url="https://www.flapw.de"
license=('MIT')
depends=('libxml2' 'hdf5' 'scalapack' 'libxc' 'fftw')
makedepends=('cmake' 'gcc-fortran' 'python' 'vim')
source=("https://iffgit.fz-juelich.de/fleur/fleur/-/archive/MaX-R$pkgver/$pkgname-MaX-R$pkgver.tar.bz2")
sha256sums=('f15f7c0b5af262b79f3dc699199767cc33d73463ec574a4e377cf576e491218b')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-MaX-R$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_Fortran_COMPILER=mpifort
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir/$pkgname-MaX-R$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
