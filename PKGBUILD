# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=iSEEhub
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="iSEE for the Bioconductor ExperimentHub"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationhub
  r-biocmanager
  r-dt
  r-experimenthub
  r-isee
  r-rintrojs
  r-s4vectors
  r-shiny
  r-shinydashboard
  r-shinyjs
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-nullrangesdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-nullrangesdata
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('523b657b491c77e31636c78ea5d50db0')
b2sums=('d46d6d4d958092d752cae8d8a771fb76cbbda0634df4b7a531833c2da6c6d04ad9c23cdedcf78841a6600d16c975e55ddd0fb8d26951296cc9496f52d0d26547')

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
