# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mashr
_pkgver=0.2.79
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multivariate Adaptive Shrinkage"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(BSD)
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
sha256sums=('158b3670277523fa3168a46a9d80a1f6dd7063091b54584cd170eb70bf85f886')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
