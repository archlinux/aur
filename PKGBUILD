# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=logr
_pkgver=1.3.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Creates Log Files"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=('CC0-1.0')
depends=(
  r-common
  r-withr
)
checkdepends=(
  r-dplyr
  r-testthat
  r-tidylog
)
optdepends=(
  r-covr
  r-dplyr
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidylog
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6b216952470eee98af6641ad8a816f97')
sha256sums=('9566dcb34d56ad742d3ac4832b5d8b93f4d374182ea877b1a022ab19ee15ea40')

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
