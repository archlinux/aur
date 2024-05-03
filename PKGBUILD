# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PSMatch
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Handling and Managing Peptide Spectrum Matches"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocgenerics
  r-biocparallel
  r-igraph
  r-mscoreutils
  r-protgenerics
  r-qfeatures
  r-s4vectors
)
checkdepends=(
  r-msdata
  r-mzid
  r-mzr
  r-spectra
  r-testthat
)
optdepends=(
  r-biocstyle
  r-factoextra
  r-knitr
  r-msdata
  r-mzid
  r-mzr
  r-rmarkdown
  r-rpx
  r-spectra
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4bfdef45b7447fec012d92d819f1512d')
b2sums=('3992d88dcf85c134ee8066c20c1900e7171f3ad45e61099ca04ef48f6ab5b011de5669edd4cbc98d1d8ce85c50bd37765045ed96914aa1433995f62073bc9a4f')

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
