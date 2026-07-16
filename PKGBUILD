# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=VDJdive
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analysis Tools for 10X V(D)J Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-cowplot
  r-ggplot2
  r-gridextra
  r-iranges
  r-rcolorbrewer
  r-rcpp
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-breakaway
  r-testthat
)
optdepends=(
  r-biocstyle
  r-breakaway
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('232c43959f88e49848809abef77c6291')
b2sums=('e76cc538a2f15b0e2247443e4d89fa7a3a1613d6b1877288474c01cc461abb467ca4103057b3e5535028d19ccf3e2bf3baaaa1063f7b97d9284d7f7e5f471838')

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
