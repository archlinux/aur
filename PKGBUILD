# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HERON
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hierarchical Epitope pROtein biNding"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-data.table
  r-genomicranges
  r-harmonicmeanp
  r-iranges
  r-limma
  r-matrixstats
  r-metap
  r-s4vectors
  r-spdep
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ddd7f5f8f5ab0feeb88a3c966746e11')
b2sums=('098a524bbcae1809d7374eb987626b0e2e59d8030357c9b0e2c516c1c1aa8b880aed208bc96738b6aa907d087bc7e15b96f7dc613f68a57df75e927168e8b347')

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
