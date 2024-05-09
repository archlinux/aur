# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=logr
_pkgver=1.3.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creates Log Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
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
md5sums=('aae1b7d263853ecafe6125b16fb017d0')
b2sums=('b09d156b1b0360e48f020bcf2b6abbda8e8dbf1f52b6e2e5177994d5b97f4a08d9c5230320aa8126791121b6b452f06c83bf181707af9ec8826063ae08c17393')

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
