# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=exdex
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Estimation of the Extremal Index"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
b2sums=('27e3826fbc428de426a8daa3d8b33faef9b21d2fcc59f7b41f6e7632294f973872b362bb061c307b89c25322e8e47d48a4dfc0a95fb8ad4591eda8780f1d2cf4')

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
