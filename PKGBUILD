# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=readODS
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Read and Write ODS Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cellranger
  r-readr
  r-stringi
  r-tibble
  r-vctrs
  r-zip
)
makedepends=(
  r-cpp11
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f1aced02d6d7d3d6d8dbef933d7c425')
b2sums=('6d11814f8761e6560c95ebac7e8a823b70639654740b393e430fe2eb2fbf1060f3ba45022a2a2a3b61a58b318f1a619aa1d23cb6f46b33f89cce2d83ef03a5c6')

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
