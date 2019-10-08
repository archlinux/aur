# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=libflame-git
pkgver=r78.b0936fbe
pkgrel=2
pkgdesc="High-performance object-based library for DLA computations"
arch=('i686' 'x86_64')
license=('BSD')
url="https://github.com/flame/libflame"
depends=('gcc-libs' 'blas')
makedepends=('git' 'make' 'gcc')
optdepends=('lapack: high-performance backend for linear algebra')
provides=('libflame')
conflicts=('libflame')
source=("$pkgname::git+https://github.com/flame/libflame.git")
sha1sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  
  # static build is necessary for some packages and programs (e. g. GAMESS)
  ./configure --prefix=/usr --enable-static-build --enable-dynamic-build --enable-multithreading=openmp --enable-supermatrix --enable-lapack2flame --enable-max-arg-list-hack
  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
}
