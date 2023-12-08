# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BOBaFIT
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Refitting diploid region profiles using a clustering procedure"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-dplyr
  r-genomicranges
  r-ggbio
  r-ggforce
  r-ggplot2
  r-magrittr
  r-nbclust
  r-plyranges
  r-stringr
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('48b9cc5c35adf6469bd1dc2ca566bed1')
sha256sums=('111aff16b4d9615fca6db51253ebb997ec54c98e5edec2ab5a8bbe309c033ac1')

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
