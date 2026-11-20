# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidytree
_pkgver=0.4.9
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
md5sums=('dd9494f1627d9484c5e1010cbc232769')
b2sums=('f39fc44e51be2e7f1820991cea43dda2f4285ced59a040d4ce3c21f1e64e71bd52569fbd223458168041ce4117cee318b4a1502bde5c29def9cacbc7c172c527')

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
