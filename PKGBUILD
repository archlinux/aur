# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Cepo
_pkgver=1.10.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cepo for the identification of differentially stable genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-delayedarray
  r-delayedmatrixstats
  r-dplyr
  r-ggplot2
  r-gseabase
  r-hdf5array
  r-patchwork
  r-purrr
  r-reshape2
  r-rlang
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-covr
  r-escape
  r-fgsea
  r-knitr
  r-pheatmap
  r-rmarkdown
  r-scater
  r-scmerge
  r-testthat
  r-upsetr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5e301e52bbcb9ad5eaa860386cc0a70e')
b2sums=('435a42ab6120e72d17fda5a6250cdffb0d5df035303b94d089059786b79740afc7d8164461cff949595e93974136767ba672f7b8aef1a1926569f8ce2cdd9520')

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
