# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=pfamAnalyzeR
_pkgver=1.14.0
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
md5sums=('c95955e83d1eb4411a84068f5466464a')
b2sums=('0aa99c310465fca0dc7bd88a78d4cdfd07399ed0b13a0d3a0a9ec2062960e4c5410a45684dc65dca644b2f639e8134b99ed0fda9bcec799b7bd97369adf3fb7f')

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
