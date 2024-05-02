# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffcyt
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential discovery in high-dimensional cytometry via high-resolution clustering"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-circlize
  r-complexheatmap
  r-dplyr
  r-edger
  r-flowcore
  r-flowsom
  r-limma
  r-lme4
  r-magrittr
  r-multcomp
  r-reshape2
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-catalyst
  r-hdcytodata
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b313c9eb4e3445de2e2a99bfacc71e48')
b2sums=('bc5c0c524edb53658824cdf0f1e7e69acb3f74b68a6a3e14dde1dadba7b68ec6ca916e3ece0310a0fb049dc93c2527d6864e118fb6ac0f997a0d4821c857c808')

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
