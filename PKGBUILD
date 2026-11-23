# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellxgenedp
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Discover and Access Single Cell Data Sets in the CELLxGENE Data Portal"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cli
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
md5sums=('b59f255ab1cda587269ab34d315a315f')
b2sums=('56a228ca09daeca346e7fc4dd4ed8624a7996390ccb48757cbd24fc96765b5e18da4853a9f194d1f92f37ba2a02e4ee272afd110ef3487f780a5cbf1bbd6d929')

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
