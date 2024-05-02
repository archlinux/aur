# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOpro
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Find the most characteristic gene ontology terms for groups of human genes"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-dendextend
  r-doparallel
  r-foreach
  r-go.db
  r-iranges
  r-multiassayexperiment
  r-org.hs.eg.db
  r-rcpp
  r-s4vectors
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rtcga.pancan12
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('66d0fd9baf669ad4eb6e944e09901111')
b2sums=('a7e8244fe6ce542e7b556a3de429e108b709ffe0cf26f8cd4d467566ae12ada78c612b9233615f8aa1fc1d8da0b627e06564ebcea13a74364e3d4af4c1c3cb75')

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
