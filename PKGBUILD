# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mosbi
_pkgver=1.10.0
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
md5sums=('e081b5b11f8be56cf80e304755e38fa0')
b2sums=('054befd6c8787bbc68bcd26623476a0466e2a6b7a352e1622acc60dd988da2b4d78bfe4d1edbfbd33112be9847ea7c8681b83bc8a992bea44d7e627135c75abd')

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
