# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mosbi
_pkgver=1.17.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Molecular Signature identification using Biclustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  onetbb
  r-akmbiclust
  r-bh
  r-biclust
  r-fabia
  r-igraph
  r-isa2
  r-qubic
  r-rcolorbrewer
  r-rcpp
  r-rcppparallel
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runibic
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6bf1df7bcda5638fda67de833c62e24')
b2sums=('faeb8f6a094424be156032ba510106cfe8714650a9ba0c4bb54bb52d35db742ca0f5b98e7d717b7c718278e88a8edf9d3b5b76220c6868c7bcaa69b304772d4c')

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
