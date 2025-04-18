# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beachmat
_pkgver=2.24.0
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
md5sums=('98b3072a971c483aae544702f84b45a3')
b2sums=('a0045fac674bbadae020323ea7493d91cf67fec480fe9790fe1004fc255d11bf68b7b9a359eed878f92b351cb8e1d51af53aa54229b717c3b9f35a80fe90ab48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
