# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hoodscanR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial cellular neighbourhood scanning in R"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('cde7b3938f36850be64055e44aa6a0ca4cbfde55e517c00ff325bdefb659dfbf')

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
