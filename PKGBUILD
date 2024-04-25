# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mashr
_pkgver=0.2.79
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Multivariate Adaptive Shrinkage"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  blas
  gsl
  lapack
  r-abind
  r-ashr
  r-assertthat
  r-mvtnorm
  r-plyr
  r-rcpp
  r-rmeta
  r-softimpute
)
makedepends=(
  r-rcpparmadillo
  r-rcppgsl
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-corrplot
  r-ebnm
  r-flashier
  r-kableextra
  r-knitr
  r-profmem
  r-rebayes
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ddec828c72b1d1b594f35a3934e7f88')
b2sums=('6bf494ce40e788cf4584cdc60d3feeed81db1623f19658a7db6f96f00c37d8cfda8d70b8f40208cb81df5ec72170764c19dc6dc407296f77f2f8db5e6a6596d0')

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
