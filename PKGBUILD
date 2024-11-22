# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=keras3
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="R interface to Keras"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-generics
  r-reticulate
  r-tensorflow
  r-tfruns
  r-magrittr
  r-zeallot
  r-fastmap
  r-glue
  r-cli
  r-rlang
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-testthat
  r-knitr
  r-rmarkdown
  r-callr
  r-tfdatasets
  r-withr
  r-png
  r-jsonlite
  r-purrr
  r-rstudioapi
  r-r6
  r-jpeg
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d979562710408f2429d4e0f9b51bcf5c')
b2sums=('ce1ab0c5cb4fdd42ec777140cd16940d521cca7fa4a71376b0ebb99184a2af620110c4397aa773f90673025b65b8c986059cb06bd9a98b65fa8325c0688c387e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
