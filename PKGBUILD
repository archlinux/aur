# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=microSTASIS
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Microbiota STability ASsessment via Iterative cluStering"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('902538dc5642c0a02dcbed55e38623f3d34fb42906dc54dc9818370fd18169cf2c27fe57aa9f0a1021da49d37fc108d66a93bb685ace52e1ab4eae1d5de52c98')

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
