# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=caretEnsemble
_pkgver=4.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Ensembles of Caret Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-caret
  r-data.table
  r-ggplot2
  r-patchwork
  r-pbapply
  r-rlang
)
optdepends=(
  r-catools
  r-covr
  r-earth
  r-gbm
  r-glmnet
  r-klar
  r-knitr
  r-lintr
  r-mlbench
  r-randomforest
  r-rhub
  r-rmarkdown
  r-spelling
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8ff469c233cd682f030426edc7528bc4')
b2sums=('92422068c3e30010891bc19280ebc423ec338db13690b1135e720d09304191da162a5294514b5e855b524b91c3bbfbb82904276841be23ef5d32a0e90df567a2')

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
