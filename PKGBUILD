# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=readODS
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read and Write ODS Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cellranger
  r-minty
  r-stringi
  r-tibble
  r-vctrs
  r-zip
)
checkdepends=(
  r-readr
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-readr
  r-rmarkdown
  r-spelling
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f826780e384d9e21b200880d4296023a')
b2sums=('8a25a216557533d0266fb0afd4dac536e64eb4870df2502765f0019284ebf9ed61e1f711cb3b74e95f47f56235b0ea68597c6081efc3a5cbdfaa175ed9a06c1f')

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
