# Maintainer: dhn <neilson+aur@sent.com>
# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggthemes
_pkgver=7.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Extra Themes, Scales and Geoms for 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-cli
  r-ggplot2
  r-lifecycle
  r-purrr
  r-rlang
  r-scales
  r-tibble
)
checkdepends=(
  r-dplyr
  r-testthat
  r-vdiffr
)
optdepends=(
  r-dplyr
  r-farver
  r-mapproj
  r-maps
  r-pander
  r-quantreg
  r-spelling
  r-systemfonts
  r-testthat
  r-tidyr
  r-vdiffr
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5914ef11bcf4a1c336c507fb59e62219')
b2sums=('f414d66e03cbf29567724888a4bfc38bb811df7faa028fb7ed0e28733d998b5cdee749bcf5c4f286ea1f7a0d83fa25a047b2e218d26a005bb66dbfcd5c11490b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
