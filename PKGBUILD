# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=logr
_pkgver=1.3.6
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
md5sums=('e347e49e53c58d8a84418e608d94debe')
b2sums=('7191417c25fa9da2f647c4483b2f487415fac24e45194a4681f3d89274b3837e8f4e8518ed1b262622b02d90830601a7412350516a2bb3caedab782196f7a6e8')

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
