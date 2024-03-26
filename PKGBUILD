# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=diffcyt
_pkgver=1.22.1
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
md5sums=('44b02895aa252ca092777135cb0edede')
b2sums=('ca4f46b54b9d4c2e70dc13ebf4c85f9c2c1c2d812e433f1537c8315e9e81de7fd4f0fdcb5a2c69c71d77ff49b5c82b3704b0cc02ec08c6fb79cd76a2047066fa')

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
