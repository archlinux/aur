# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TreeTools
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create, Modify and Analyse Phylogenetic Trees"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-ape
  r-bit64
  r-colorspace
  r-fastmatch
  r-lifecycle
  r-plottools
  r-r.cache
  r-rcurl
  r-rdpack
)
makedepends=(
  r-rcpp
)
checkdepends=(
  r-phangorn
  r-purrr
  r-testthat
  r-vdiffr
)
optdepends=(
  r-knitr
  r-phangorn
  r-purrr
  r-rcpp
  r-rlang
  r-rmarkdown
  r-spelling
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4511cbf60e3178ea966bff71b092fb3a')
sha256sums=('b2a0c4a6ae49c70e4b743276591a66d477cf6b2789bb51ded23df891754317be')

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
