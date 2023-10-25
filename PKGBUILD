# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellxgenedp
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Discover and Access Single Cell Data Sets in the cellxgene Data Portal"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-curl
  r-dplyr
  r-dt
  r-httr
  r-jsonlite
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
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('517b416a57c2b6ba0fd92cd0dd3a8935')
sha256sums=('12a6971cfccc32561915e71d48aa5ca33ff773a16ca2db12f77ea271c29c7db0')

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
