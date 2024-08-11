# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cliqueMS
_pkgver=1.18.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation of Isotopes, Adducts and Fragmentation Adducts for in-Source LC/MS Metabolomics Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-coop
  r-igraph
  r-matrixstats
  r-msnbase
  r-rcpp
  r-slam
  r-xcms
)
makedepends=(
  r-bh
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocparallel
  r-camera
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e260bec18ac872450215aec5cb95f16')
b2sums=('492822bd915f14f3ccefd6addbdfe40919a2272dde5c8b9f59f163fb8e9f36ed4d7da8428d71f7b2ad44f427c396c65b8b622ec693a3074be808c68aa2ff8f5f')

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
