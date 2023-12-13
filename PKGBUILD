# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=terraTCGAdata
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="OpenAccess TCGA Data on Terra as MultiAssayExperiment"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('0ea975f5dc017c484aacfaad03a22a155989b2eff441b76acab9367654b05731')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
