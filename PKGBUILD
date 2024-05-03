# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qsvaR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generate Quality Surrogate Variable Analysis for Degradation Correction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-summarizedexperiment
  r-sva
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-covr
  r-knitr
  r-limma
  r-refmanager
  r-rmarkdown
  r-sessioninfo
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dfcabbab85cfd51c933babbe84c9be1d')
b2sums=('e58c16a50de82c3b4338fa99613098b021e8c7601121919039fdd545943133de5e0b5ac12db73485dae977611488c59908f88d3c704e5a7b9bb2080bcf17b6fb')

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
