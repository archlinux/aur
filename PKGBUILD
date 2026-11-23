# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=updateObject
_pkgver=1.16.0
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
md5sums=('2826c0eccbdfa046e15b45518fb3a918')
b2sums=('f9c4ec39846abf75d7e4d3648d4eb9c69dcda8ba2ea42f3f481bae53d5b84cc2de54aa26f5ebd35ca96637af77ee1c09360bb9ed2538b23754dc47defa0f4bdc')

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
