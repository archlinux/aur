# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cellxgenedp
_pkgver=1.6.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Discover and Access Single Cell Data Sets in the cellxgene Data Portal"
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
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c66252d3d760b9012613c5cb3df36ba')
b2sums=('99536ef9fa46945aaeb208793a5942b89f50752707639f37a5605ca9412d69d6d29315b54d383d17a3e333d211b58345e96e4f34a377eafc2cec50061e3be061')

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
