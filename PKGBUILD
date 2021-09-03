# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=libxc
pkgver=5.1.5
pkgrel=2
pkgdesc="A library of exchange-correlation functionals for density-functional theory"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.tddft.org/programs/libxc"
license=('MPL2')
makedepends=('gcc' 'gcc-fortran')
source=(http://www.tddft.org/programs/$pkgname/down.php?file=$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('02e4615a22dc3ec87a23efbd3d9be5bfad2445337140bad1720699571c45c3f9')
options=(staticlibs)

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake $srcdir/$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DENABLE_FORTRAN=ON \
        -DENABLE_FORTRAN03=ON
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
}
