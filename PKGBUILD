# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=svd
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('bee5e3da2a81e49b797763fa5467f895')
b2sums=('2ad4a28b2d8c4f5d213ef97be4f877329ca1ac5cf59feff4ad88f80265b0c87f39dc431d88f9c26daddd30dac259bb673d43f20b64d07ec0efcbc51209fa3a68')

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
