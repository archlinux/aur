# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BioNAR
_pkgver=1.8.0
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
md5sums=('6d871ed023436cf01a3eda576b888423')
b2sums=('bc7e94ee14b28d7277255f0498bb93199f1a47b1b2e88f0c6d1941cae9e3aab366a12b8472b83a5eb85d27d82ecf25a58cac1c6ef72af92d8818e6a5e2459259')

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
