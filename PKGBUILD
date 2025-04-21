# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEde
_pkgver=1.6.0
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
md5sums=('50e88eba3b853390e5169573a961024b')
b2sums=('a509ea9ec41e3a9ba57f43a3709c39f69a0f44734eb63756050f7e88fde6d28432f8c17cbffe56d4d1986f55987453a532474a8be2684a2306c82c78a4ddbf8c')

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
