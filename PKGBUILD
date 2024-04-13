# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaVolcanoR
_pkgver=1.16.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Gene Expression Meta-analysis Visualization Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cowplot
  r-data.table
  r-dplyr
  r-ggplot2
  r-htmlwidgets
  r-metafor
  r-metap
  r-plotly
  r-rlang
  r-tidyr
  r-topconfects
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d93a07e8d8ccd35bf8949fee9392b0e0')
b2sums=('527cc458c97f23fb721bf348c58ae3b516a5e23fced38ec8d4783b5c7c864dfccbfef3d33b0a9487dd2fe41f77f2868b0a5d0555c09c8bee1602b6dc28088b41')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
