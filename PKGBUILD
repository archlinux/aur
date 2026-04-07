# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pbdMPI
_pkgver=0.5-5
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
md5sums=('c2dc939d79165c2e284f2aa24d888423')
b2sums=('56b58b53b98374a67938a237d38a3a324e186cbfb3d4edf00ba5aabd668564ec207e381d1ada7517468914b74a037518fed723a9fb8e06d65cbc66af4d4a7e35')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
