# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beachmat
_pkgver=2.26.0
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
md5sums=('11a56ce6354e9e5b48f4854c7a328175')
b2sums=('6a5d24052473474f3e40bab8da20f7b37de7d4b13817b60f052935817cb08a11e415f900f06b850bd651eff74b186b2c38cbf212ce12631be3c555ba5df7d9ee')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
