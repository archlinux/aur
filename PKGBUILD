# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svd
_pkgver=0.5.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interfaces to Various State-of-Art SVD and Eigensolvers"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ac51e8e7e1a88e0815f05704c27fcb63')
b2sums=('7b0ba150d3890e6faf619f082f7b5b178cb064710bc1eaf30d55777666b76a2d95bb5db70227e82df5d2d9d38c18207c8a2ff7c1974944bab2077dd167d462fc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
