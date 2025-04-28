# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CTSV
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of cell-type-specific spatially variable genes accounting for excess zeros"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-knitr
  r-pscl
  r-qvalue
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8f7a63b9cf89010024055e612a0494c')
b2sums=('202a26fb98915c4d96a79d3c0a8d7a50e5de9522dc9155f4ef47fb9b4e9c673bbb9fa0762e8209b4b9dd8468b1270480b5586b4ec06935467b7d99cfa1ee2822')

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
