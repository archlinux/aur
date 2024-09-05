# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gsignal
_pkgver=0.3-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Signal Processing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pracma
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-ggplot2
  r-gridextra
  r-knitr
  r-microbenchmark
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('74f3a79c1d6963b8fa14b1a0cb843e10')
b2sums=('8bc3d52a42ac1b0880ab49b899b8f350b1c544dcaec17997ce1d3828533ef258ae0b7e2cc45ab2536df4c0f3e6d352dec84c4b171aa4c6451c233cf36ba764d8')

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
