# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=comapr
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Crossover analysis and genetic map construction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-circlize
  r-dplyr
  r-foreach
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gviz
  r-iranges
  r-plotly
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-statmod
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64dbcfb7f563dc874dc327988ebf8c07')
b2sums=('5f9280d88b690b0a3e7519c61cdd0feefb31a43d7e506fa619dc5307fd3ed9e5d35856b484c3e0b327899657687bd47f75a46b6c7471ea2f5e169e82d9a868e3')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
