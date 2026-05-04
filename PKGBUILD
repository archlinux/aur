# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidytree
_pkgver=0.4.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Tidy Tool for Phylogenetic Tree Data Manipulation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ape
  r-cli
  r-dplyr
  r-lazyeval
  r-magrittr
  r-pillar
  r-rlang
  r-tibble
  r-tidyr
  r-tidyselect
  r-yulab.utils
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6930428f859016b631e6292e1b7984f9')
b2sums=('512daacd2060e1bd792d96de444fa38dfd5b5ecd04e11c01d4b49fdd5796833f4f46bd72e4c8523e8a8626328b3f82605d9fc67e6b25bb3d9ea20123eced34c6')

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
