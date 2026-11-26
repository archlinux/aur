# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HERON
_pkgver=1.12.0
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
md5sums=('fc6fc7015089452f75dc4a5411fb51b5')
b2sums=('fcaaa60cd2306b8aea7f9fbc57ffedc2aafaa769bdd6b4b3fdc508b25142b507087d4cfdedf94c741f99595019327d72c072d18984396fa68c4ea19ebdf714c5')

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
