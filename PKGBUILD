# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DGEobj
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential Gene Expression (DGE) Analysis Results Data Object"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-assertthat
  r-magrittr
  r-stringr
)
checkdepends=(
  r-biomart
  r-edger
  r-genomicranges
  r-testthat
)
optdepends=(
  r-biomart
  r-conflicted
  r-dplyr
  r-edger
  r-genomicranges
  r-glue
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8d84369964ade6ee4707681568feb390')
sha256sums=('c3deabb98e90085373a4a438f40e7b481e7cc37e9ebd9ade356ee43599a1cd02')

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
