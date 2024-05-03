# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=terraTCGAdata
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('632cb9eca5d80133fe84378065a1875a')
b2sums=('1908cafa3970c9b8b77c4cad4a57a2fa50c2ddcaf23dc626681c5d09315a7c1b568647deb54545ff2e05fccb1844a7b30caa6078e8d172e4a92210796553114a')

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
