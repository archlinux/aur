# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GOpro
_pkgver=1.38.1
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
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55aaddd575c65820fe7194954faf1a28')
b2sums=('b77df28eda175fa768834069c67b5944d42b8d578f5a16604fd7c01c8f2d237913f9c896d145c3cbe284d5e353408b7d52a7b624139bd9d32ebb0d33daf888e8')

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
