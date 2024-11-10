# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=microSTASIS
_pkgver=1.6.0
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
md5sums=('aa143ed7e2e787173f15f326de7bdbb8')
b2sums=('49a6c0511d7bf5222ee4029ae6dd1292cbf5598dc50d2060dbe03cf52dbd3e5d4c9f365d20f1665e6731c8cc2bf5148ae537af4ce1807cd7a1d1f2b456cedcde')

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
