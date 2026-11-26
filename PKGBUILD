# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=updateObject
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Find/fix old serialized S4 instances"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  git
  r-biocgenerics
  r-digest
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-biseq
  r-genomicranges
  r-interactionset
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0708b7addc515e319f2137e10254821a')
b2sums=('13a32f468cdad663170bf4a6dc7f354e62b71b1af23f2e624fd91adac4af5e8470690af4596072d2266c9144ea51e73e248d1fbea450c1a983a90ed715956b7c')

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
