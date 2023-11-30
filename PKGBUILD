# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggformula
_pkgver=0.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Formula Interface to the Grammar of Graphics"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-ggplot2
  r-ggridges
  r-labelled
  r-mosaiccore
  r-rlang
  r-scales
  r-stringr
  r-tibble
)
optdepends=(
  r-broom
  r-covr
  r-dplyr
  r-ggplot2movies
  r-ggthemes
  r-interp
  r-knitr
  r-lubridate
  r-maps
  r-mosaic
  r-mosaicdata
  r-palmerpenguins
  r-purrr
  r-quantreg
  r-rmarkdown
  r-sf
  r-testthat
  r-tidyr
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8eee6fba1dc5081b680ecd4ae73c42b4')
sha256sums=('d569f83e059f9e4836bd513f92706fb8a614300f744dcc47bf86e8dafd8e776d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
