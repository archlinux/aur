# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TissueEnrich
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tissue-specific gene enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ggplot2
  r-gseabase
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a5e44caa8db0d86ab6657533fb022638')
b2sums=('6db810c68b8036bf3a51ee8e5f6780f2d97d5ec697f816bf6a107d96b9d26aa9e9c0de78e4751435cc8264534303b88388d727cd38b5c97900f67f16d5c8ecdc')

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
