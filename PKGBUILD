# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EDIRquery
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Query the EDIR Database For Specific Gene"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
  r-interactionset
  r-readr
  r-tibble
  r-tictoc
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
md5sums=('b750e4e2b940180022325feb8e723c84')
b2sums=('d03fc98b37f7b3ec9691b429aaa37b40093b45b5d4d23fc2bbb041a9b0409274ee6d09ea339591586b279192a7fa5d3c32242f4bae096374961f9177a4dc9a21')

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
