# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pbdMPI
_pkgver=0.5-2
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
md5sums=('f99a248812456d71f001fef8ffd5a206')
b2sums=('c3be8aabe86b9ba9cafd3d3fa130c064b3dd54b5880c4d832725ec661722b06d0eeaf1335a09e0223aa3f36216bf6a0607109cf941f590620a0997ce46c60e1c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
