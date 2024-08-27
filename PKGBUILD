# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=caretEnsemble
_pkgver=4.0.0
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
  r-devtools
  r-earth
  r-gbm
  r-glmnet
  r-klar
  r-knitr
  r-lintr
  r-mlbench
  r-pkgdown
  r-randomforest
  r-rhub
  r-rmarkdown
  r-spelling
  r-testthat
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8792e74df9d3698f173c395673207f1')
b2sums=('cae85f7174076349a9ae5cd27f7ce90f9335b35640743ef18c14d204643441be0348b66da169c1de60b96943ba2dc3370e818caf8723aa42ea13ac9dd66a8455')

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
