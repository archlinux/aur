# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pbdMPI
_pkgver=0.5-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R Interface to MPI for HPC Clusters (Programming with Big Data Project)"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MPL-2.0')
depends=(
  openmpi
  r-float
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9aee917730ba399eeccae27c080545fe')
b2sums=('254bb62951f120312d76d34cb2fdeaecc9b11b92fc4b322a16d08f4c8d66184b7b9df2eab50ec1f57427a820b1709823b967a79e2a29bb0232800ffa98a129de')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
