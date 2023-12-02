# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=exdex
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Estimation of the Extremal Index"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-chandwich
  r-rcpp
  r-rcpproll
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-testthat
  r-zoo
)
optdepends=(
  r-knitr
  r-revdbayes
  r-rmarkdown
  r-testthat
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a30891a6c53ec03fa527562dedba2b2f')
sha256sums=('e6668c37c5c3762f550373f4e24a0fdd3af74b7d38562c0930c0abfe4499abee')

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
