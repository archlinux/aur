# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Summix
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Summix2: A suite of methods to estimate, adjust, and leverage substructure in genetic summary data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-bedassle
  r-dplyr
  r-magrittr
  r-nloptr
  r-randomcolor
  r-scales
  r-tibble
  r-tidyselect
  r-visnetwork
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7fe653455de7f81c916b60eab39de2d2')
b2sums=('faec9c8b12bb1d365881590caeedde1c9ebdd8b42c8e40a96496df1e6f00b0663e2e69563b23a3ea189cdddc13cb630ea6accdbbe3fea32a12dd0568bfcf74c7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
