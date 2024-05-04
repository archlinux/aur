# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Summix
_pkgver=2.10.0
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
md5sums=('b5c285639f96284509d0de75ef33f7f1')
b2sums=('e9b28af468ef135b7b234a576d0100b760002fab1d4af703aac8afc5e9efc36933d566f146352f28f3080ff57216b471407cac504550d330daad07c2bb9cd13c')

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
