# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TissueEnrich
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tissue-specific gene enrichment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ensurer
  r-ggplot2
  r-gseabase
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5cc00925f523a6d82b216343e7f4b81a')
b2sums=('d41c2a445c1ef71051e79dc00b1acfd4876a2153c92604a1362d9eec20aed59330e0947ec7e44827cac3a064961e889bb22d5134165d994e685aca5a3976ab27')

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
