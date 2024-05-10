# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellxgenedp
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Discover and Access Single Cell Data Sets in the CELLxGENE Data Portal"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-curl
  r-dplyr
  r-dt
  r-httr
  r-rjsoncons
  r-shiny
)
checkdepends=(
  r-mockery
  r-testthat
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-knitr
  r-mockery
  r-rmarkdown
  r-singlecellexperiment
  r-testthat
  r-tidyr
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5fc4fa7d7c856fdb046c28183227a917')
b2sums=('0bf8cbf6a01e302a157b6e8045c0322105944063d5df781ceb461f3b9e1e461b89a6c516e101b08a4578d07bbfabd94f9836e50680d38a8540b3ad7b8cc928df')

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
