# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Summix
_pkgver=2.18.0
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
md5sums=('1b63b9e4bd6e4f9111c5322213cd197b')
b2sums=('5e7da1b8474d5a83a0ed409ab3ea2e580d2bfd6f8f371bcdc58e2962b1197c886eeaefbd9adb23796c660b6845c064d8b2922c4dbd7434b7c2fc39dd98577b03')

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
