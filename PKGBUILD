# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=p4est
pkgver=2.8.7
pkgrel=1
pkgdesc="Parallel adaptive mesh refinement on forests of octrees"
arch=('x86_64')
url="https://github.com/cburstedde/$pkgname"
license=('GPL-2.0-or-later')
depends=('glibc'
         'openmpi'
         'metis'
         'blas'
         'lapack'
         'zlib')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0a1e912f3529999ca6d62fee335d51f24b5650b586e95a03ef39ebf73936d7f4')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static --enable-mpi --enable-pthread --enable-vtk-doubles --with-metis CC=mpicc CXX=mpicxx F77=mpif77 FC=mpif90 LIBS=-lm
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
