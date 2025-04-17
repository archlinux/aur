# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Summix
_pkgver=2.14.0
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
md5sums=('a8b21a6734047ccbce3eed6f0d3ce961')
b2sums=('cecea815e561d7751cdd1ab4f7c445f07508091085dd48fa3d60e8779e9f59d475567b5f62bcb00514e1d1eb4d34bd3a86b4c9e137ab749f0413378876f21970')

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
