# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEde
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('ef63989cd800352207ea9004c2579544')
b2sums=('35f6bca544887124b98f33df14c95b517ba5e98c2faafbe4a406e316d348806a303d69324f097f00618cb1bd39ec213b9bf5ed2adbe0b88fd6157338eacc7c7d')

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
