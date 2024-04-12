# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mwcsr
_pkgver=0.1.8
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
md5sums=('1081f613fa98efb7e48eeee25c55240e')
b2sums=('ebfeaeda1a63eaf6d7c70027137d3bf763078e80250cf6e901e6b831026b3f2d4655b401df92125053416f228ae36c5ecdaacf268814f99e93164ddde56d4b91')

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
