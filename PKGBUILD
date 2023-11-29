# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BioNAR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Biological Network Analysis in R"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('4cbc1fe5bd753444b3470a317029a885')
sha256sums=('dacd5ee2b304b30fc882ff29336e603bce098c07d62a81d24d76ff1e4bb77c22')

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
