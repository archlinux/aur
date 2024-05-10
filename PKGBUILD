# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BioNAR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Biological Network Analysis in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-clustercons
  r-cowplot
  r-data.table
  r-dplyr
  r-fgsea
  r-ggplot2
  r-ggrepel
  r-go.db
  r-igraph
  r-latex2exp
  r-minpack.lm
  r-org.hs.eg.db
  r-powerlaw
  r-rdpack
  r-rspectra
  r-rspectral
  r-scales
  r-stringr
  r-viridis
  r-wgcna
)
checkdepends=(
  r-igraphdata
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-devtools
  r-igraphdata
  r-knitr
  r-magick
  r-pander
  r-plotly
  r-randomcolor
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('09f2f54ad370dfbd2c42d2921f886102')
b2sums=('122ef665600aeefde372364f7e0b7234090cf95248e5aefbcf10225e250db2a0e2d14239965f371dd3979b5ef7e157d89294428b749f62c13b6b8b495ae0f92f')

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
