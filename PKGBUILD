# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pbdMPI
_pkgver=0.5-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to MPI for HPC Clusters (Programming with Big Data Project)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MPL-2.0')
depends=(
  openmpi
  r-float
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c0ba8672cbc24c0f839cb0c60601398a')
b2sums=('f9ea9e10c9ddb5b149e7e1f8a4600545fbdb6ad5f74a4ea3351732a4245a5a711cde031182bf95770dd15e81c15c4a1758b9b5d80cc3aabd2a0531fc428eeb8f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
