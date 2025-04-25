# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proxyC
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Computes Proximity in Large Sparse Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  onetbb
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-entropy
  r-proxy
  r-testthat
)
optdepends=(
  r-entropy
  r-knitr
  r-proxy
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c14453641ed056c375ef88e0146d6708')
b2sums=('634bb467d715215993146542096bd7c2e8eb922667c9da66aa879cbdf80ec23d82d049f2bf79dcabd1de2355b2e343886a654520e14142652a5b308ae8d7ce9e')

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
