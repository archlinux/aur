# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=terraTCGAdata
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="OpenAccess TCGA Data on Terra as MultiAssayExperiment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-anvil
  r-biocfilecache
  r-dplyr
  r-genomicranges
  r-multiassayexperiment
  r-raggedexperiment
  r-readr
  r-s4vectors
  r-tcgautils
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b5803a78627bbe874b8cd8ae0a147979')
b2sums=('c4e6df5fa24c3eed58e4c2b2579f124815799b0733eb82e46841fae6da7f8580a8fe838c94b3edfdbc852fa20a2a2bdcee45b14280ca2efc0672451064fbcf8f')

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
