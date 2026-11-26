# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellxgenedp
_pkgver=1.18.0
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
md5sums=('f5e49349851088565b8fce2c4a86acca')
b2sums=('261c2505ff43e272a7b2bc34996e68843761adba74e88c26f9de0e6a8f97a979374b2b18a523c7bb4cd89c5aad090a9f861fa66a350743555cfe763317c3aa1c')

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
