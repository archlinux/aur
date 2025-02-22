# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cliqueMS
_pkgver=1.20.0
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
md5sums=('4161bbb24c1fa3fdf7bc9b558f8c435f')
b2sums=('f29760ecfe507e5c4401ad56c7bcdfa37ca535261e20c17cbc4889fd739278aa0b4d333c97d5578b075005f26a30f2be0c56ad15e6dddc4af58bce53e631c124')

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
