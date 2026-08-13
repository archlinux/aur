# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mvabund
_pkgver=4.2.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Methods for Analysing Multivariate Abundance Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-rcpp
  r-statmod
  r-tweedie
  gsl
)
makedepends=(
  r-rcppgsl
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ecostats
  r-knitr
  r-rmarkdown
  r-skimr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('462bac3abb84e46d1878d43143788e14')
b2sums=('88af3573ce9b8a81584077566c3359693f4b7aea451f3771474c2eab4acb1f8a327b23b5506fd82b674a69e971f4a020e0329d22384f5998f1b3180fca195c43')

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
