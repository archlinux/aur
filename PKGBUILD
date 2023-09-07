# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mfa
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Bayesian hierarchical mixture of factor analyzers for modelling genomic bifurcations"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL)
depends=(
  r-biobase
  r-coda
  r-dplyr
  r-ggmcmc
  r-ggplot2
  r-magrittr
  r-mcmcglmm
  r-mcmcpack
  r-rcpp
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a47205412204ffd49737d41b7b78574d')
sha256sums=('043a7b884c4d454c12b0c9066f114faf1824eb531630a92053cb42ac684488e5')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
