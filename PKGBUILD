# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MetaVolcanoR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Gene Expression Meta-analysis Visualization Tool"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('697e849a45f3ceae9ff730fc7717d6ca')
sha256sums=('d25e4304b5f8ae7c405c29004d9afe638b23011903e6338460bc9835c196dd85')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
