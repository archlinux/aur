# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=COTAN
_pkgver=2.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="COexpression Tables ANalysis"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-assertthat
  r-circlize
  r-complexheatmap
  r-dendextend
  r-dplyr
  r-factoextra
  r-ggplot2
  r-ggrepel
  r-ggthemes
  r-irlba
  r-paralleldist
  r-parallelly
  r-plyr
  r-rcolorbrewer
  r-rfast
  r-rlang
  r-scales
  r-seurat
  r-stringr
  r-tibble
  r-tidyr
  r-umap
  r-withr
  r-zeallot
)
checkdepends=(
  r-r.utils
  r-testthat
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-data.table
  r-geoquery
  r-gsubfn
  r-htmlwidgets
  r-knitr
  r-plotly
  r-proto
  r-qpdf
  r-r.utils
  r-rmarkdown
  r-rtsne
  r-sf
  r-spelling
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec3bbfe10c1ede4ae12398534ab5395b')
sha256sums=('c1cf78c924b2566204cddce43fe15ea0d935688bc48d6bff81478134e0548d46')

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
