# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=nanotatoR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Next generation structural variant annotation and classification"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LicenseRef-nanotatoR')
depends=(
  r-annotationdbi
  r-curl
  r-dplyr
  r-genomicranges
  r-hash
  r-httr
  r-knitr
  r-openxlsx
  r-org.hs.eg.db
  r-rentrez
  r-rlang
  r-stringr
  r-testthat
  r-tidyverse
  r-varfrompdb
  r-xml
  r-xml2r
)
optdepends=(
  r-rmarkdown
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e808c68591d98effbfdba4dbac07ac91')
b2sums=('337e99575b94adc4658f8fa14e8358460f591effd1f723dc22f3f22492afd3aa7cb4e04d3e9a875db9208bdb1ca146082808fca0fadc5a154475f4c0582f75dd')

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
