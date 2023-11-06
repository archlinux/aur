# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=microSTASIS
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Microbiota STability ASsessment via Iterative cluStering"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-ggplot2
  r-ggside
  r-rlang
  r-stringr
  r-treesummarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gghighlight
  r-knitr
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b9b67613eb5e6b69918dffc9d4060d8')
sha256sums=('9ca497654f2e36d340ea7efad8792b625c30dde10400ae83284464d9ba00a266')

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
