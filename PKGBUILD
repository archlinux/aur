# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pfamAnalyzeR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('20159a7f365760efda4827ae6fff80d3')
b2sums=('bd3f930f4597c1402c326de4e3a8c87301ecee0e012b62a499365f08c1f75ac3b070da7d4e59b7876c2aec6822fa829a7b14eb11ffef81da480db922be1a3334')

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
