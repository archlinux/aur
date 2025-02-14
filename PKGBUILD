# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffcyt
_pkgver=1.26.1
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
md5sums=('411511b7442710c5daa4e96c21f582e1')
b2sums=('541a3d2002eb2e34640438b07b4b06a88c6250350cb0ef18aa9cd2203db895e36027f921d3826d440881cf5ffa60ba3d0dc6477b44877f6a734ceb4f57766257')

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
