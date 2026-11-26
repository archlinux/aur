# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=beachmat
_pkgver=2.30.0
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
md5sums=('3f93033874c3ac1f13f02b65ff5ff48f')
b2sums=('4f1eaed124f62a4d056b7487e12e0b57154e39072936105a4d3c3a6c2239d95f51fd7315b3cf868ba4cbb9baf1f9bf9176eb9e5783b999f2ffb26faa3127177a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
