# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffcyt
_pkgver=1.26.0
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
md5sums=('36746fa6a908f973272a264242b0b39a')
b2sums=('ddebe274a88bcd1ac599d609401ca3b02df57c5d0718e2ba32c00dc579d21f74e0161ae630c42faebada2876b8c4f44e89bdb3ae8b4b9a8a02ff8be536530e1a')

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
