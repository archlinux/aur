# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidytree
_pkgver=0.4.8
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
md5sums=('076bdc9b26f8da5591af7f61d57a4f15')
b2sums=('aaacac8001b38b937af6e3c7cc93aaf0f14d5740315e254b6fc25ce6476be05eb8aea9093664dc472ad4f9b6b33e933dab35a0424feed86bf4f17c01fdc384ae')

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
