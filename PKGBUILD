# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=caretEnsemble
_pkgver=4.0.2
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
  r-cyclocomp
  r-devtools
  r-dt
  r-earth
  r-gbm
  r-glmnet
  r-htmltools
  r-klar
  r-knitr
  r-lintr
  r-mlbench
  r-pkgdown
  r-randomforest
  r-rcmdcheck
  r-rhub
  r-rmarkdown
  r-roxygen2
  r-spelling
  r-testthat
  r-usethis
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5cb86f8cdde11e0362fdd8a921ee047c')
b2sums=('8bd02b063d6d02bf377dfeee039c5de92f21b369c805ed3234c298f77b6382000b197c3d92611614a5bcb367f001ab75dfd9f67bf07c2e5c8483dadff6a2e643')

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
