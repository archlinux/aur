# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEde
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="iSEE extension for panels related to differential expression analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-deseq2
  r-edger
  r-isee
  r-s4vectors
  r-shiny
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-airway
  r-biocstyle
  r-covr
  r-knitr
  r-limma
  r-org.hs.eg.db
  r-refmanager
  r-rmarkdown
  r-scuttle
  r-sessioninfo
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4d6215b9243635ed9dd3b6fcf5cbf166')
b2sums=('d4831d36762dad84d657931edbbb9792c2b3539353565eb96606b29e38c5df0d6e5838d7b510192b62ee3aa589e55aa4b7ecf72321db29a3af7cd8b491d02a56')

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
