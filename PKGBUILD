# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOpro
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Find the most characteristic gene ontology terms for groups of human genes"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-dendextend
  r-doparallel
  r-foreach
  r-go.db
  r-iranges
  r-multiassayexperiment
  r-org.hs.eg.db
  r-rcpp
  r-s4vectors
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-rtcga.pancan12
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('322bf28520208bfae9cbd508ebebd7e2')
b2sums=('30438c060b817a5ac4ad1b06074aaeef69ecd8d305dfe55514dcf0c0911856a9b315d5c5b4c2d1718ea24cf2affa5f96cb773af21d1ed03021eb39338f9e54c4')

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
