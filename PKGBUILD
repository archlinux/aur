# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pfamAnalyzeR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of domain isotypes in pfam data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-magrittr
  r-readr
  r-stringr
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('35528049bbe6c0fe561287bc2a39c3e4')
b2sums=('5a8cec628cd86269c281f7199f7cc186589b3ecc5567cbe67c3e183aae7720cca4bacb619cf21ba9a0b3488aba64bdfd4303254157404f5b1f4b3210bda5eec1')

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
