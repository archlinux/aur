# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mwcsr
_pkgver=0.1.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solvers for Maximum Weight Connected Subgraph Problem and Its Variants"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  java-runtime
  r-igraph
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bionet
  r-dlbcl
  r-knitr
  r-mathjaxr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('72806b951091aae26cfc494cdc8ed33b')
b2sums=('624237178adedcaf723f26fcdc809e5beabe29307bc1f2bbcb149b7e7ae5ac7404eb27ca840af8c3a694bfbf970a9156f2e3e6e6a4ae6828b669bc9ba48e8503')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
