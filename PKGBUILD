# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=microSTASIS
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('16d2fb80ef76cc219a87d14ba767561d')
b2sums=('6cf1ba5bbc1753a9a6cd8c6c4e5f0beeb1fbd24c1efca01716d0d8956875d27d0d88abb4a5d966434c74b45eaf4662724809ef81547e78b1450e014dadf6c8df')

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
