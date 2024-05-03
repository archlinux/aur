# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=microSTASIS
_pkgver=1.4.0
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
md5sums=('d2777d8d67b5bfed27c1792b14766689')
b2sums=('523d80c065d016da5f926c7a70b544fd14f59ce4736f6be61dbe723ca30173aea2be84a3967512dfa6a8779e5b422d0f7745b5a1582ae2fbae70f4ff9cb11a5b')

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
