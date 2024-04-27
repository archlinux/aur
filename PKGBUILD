# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hoodscanR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Spatial cellular neighbourhood scanning in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-circlize
  r-complexheatmap
  r-ggplot2
  r-knitr
  r-rann
  r-rcpp
  r-rlang
  r-rmarkdown
  r-scico
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c5ac598990d1f80bfa526c576abc8d84')
b2sums=('8f8625305636b916b66aeaec9560fd97245f61922a83d4f7e5b29e365fd89d8e02133dd55fc4a368dbb963e1556dd90a59cbb388a8b16e07c8b43f130eb381d6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
