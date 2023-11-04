# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rexposome
_pkgver=1.24.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exposome exploration and outcome data analysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-biobase
  r-circlize
  r-corrplot
  r-factominer
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-glmnet
  r-gplots
  r-gridextra
  r-gtools
  r-hmisc
  r-imputelcmd
  r-lme4
  r-lsr
  r-mice
  r-pryr
  r-reshape2
  r-s4vectors
  r-scales
  r-scatterplot3d
  r-stringr
)
optdepends=(
  r-biocstyle
  r-flexmix
  r-formatr
  r-knitr
  r-mclust
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5dec247e3db216fed87e97cbfbf254cc')
sha256sums=('44a21ed78978bf201f9152611730bde7fe5529f628afc83a00451fa024837a99')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
