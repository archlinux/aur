# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HERON
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('9c146a8d99bada338098732e1de5a5e2')
b2sums=('318a9d20e866bba31c9dcb0d32711583ee99df3a2034cc77f97e76a8387eebaa6a7ed9dd70f33f45d03c176fbabe86f39a058e41a1fdf15adc81d2911df95bfe')

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
