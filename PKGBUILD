# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BioNAR
_pkgver=1.6.1
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
md5sums=('1b27df37f97c29096889e1f803e301dd')
b2sums=('0d9f8a9beeaea1ee98043f85b5738be6f42e8ecc3ae891331806caede25d56cc373bf3a20317acd797dc7ce2ad7c16a9f279e138f11ebeef074d0debf24c8839')

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
