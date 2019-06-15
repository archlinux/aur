# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=treekin
pkgver=0.5.1
pkgrel=1
pkgdesc="Efficient computation of RNA folding dynamics"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/RNA/Treekin"
makedepends=('blas'
             'lapack'
             'lapacke'
             'mlapack>=0.8.1')

optdepends=('barriers: Compute generated transition rate matrices')
makedepends=('gcc-fortran')
source=(http://www.tbi.univie.ac.at/RNA/packages/source/Treekin-${pkgver}.tar.gz)
sha256sums=('aae56c1a746829b02a9b97c6a54d1d58348718d4ca585ef41a5dbdd41d5c9f06')

build() {
  cd "${srcdir}/Treekin-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  depends=('blas'
           'lapack'
           'lapacke'
           'mlapack>=0.8.1')
  provides=("treekin=${pkgver}")

  cd "${srcdir}/Treekin-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
}
