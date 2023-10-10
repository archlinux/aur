# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pbdMPI
_pkgver=0.5-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to MPI for HPC Clusters (Programming with Big Data Project)"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MPL2)
depends=(
  openmpi
  r-float
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a643799993c8ecf9c2d1cff9e3e615b9')
sha256sums=('fd70950c4d0df37713e50df9b999873a11e7c5473b5d0dd94997e706e518dd71')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
