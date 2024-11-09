# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beachmat
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Compiling Bioconductor to Handle Each Matrix Type"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-delayedarray
  r-rcpp
  r-sparsearray
)
makedepends=(
  r-assorthead
)
optdepends=(
  r-beachmat.hdf5
  r-biocparallel
  r-biocstyle
  r-hdf5array
  r-knitr
  r-rcmdcheck
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3e11f4224ff4e9cfa1ebffae6f9bfee4')
b2sums=('b10fefbb5da6b05a940d87a869b08a2073d4a81ea37fa44a0b57425e81cedb344048494e7f77860da24ba1efd1b0e93700a2ca0bd2b9d18eee70c219a5099eb3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
