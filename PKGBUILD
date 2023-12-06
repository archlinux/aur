# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Voyager
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="From geospatial to spatial omics"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-biocparallel
  r-bluster
  r-ggnewscale
  r-ggplot2
  r-lifecycle
  r-matrixstats
  r-patchwork
  r-rlang
  r-rspectra
  r-s4vectors
  r-scales
  r-scico
  r-sf
  r-singlecellexperiment
  r-spatialexperiment
  r-spatialfeatureexperiment
  r-spdep
  r-summarizedexperiment
  r-terra
)
checkdepends=(
  r-automap
  r-dropletutils
  r-ggh4x
  r-gstat
  r-hexbin
  r-scater
  r-scattermore
  r-scran
  r-sfedata
  r-testthat
  r-vdiffr
  r-vroom
)
optdepends=(
  r-automap
  r-biocsingular
  r-biocstyle
  r-cowplot
  r-experimenthub
  r-ggh4x
  r-gstat
  r-hexbin
  r-knitr
  r-pheatmap
  r-rhdf5
  r-rmarkdown
  r-scater
  r-scattermore
  r-scran
  r-sfarrow
  r-sfedata
  r-testthat
  r-vdiffr
  r-vroom
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cc32e63cf1c410d82c2cd1a26f9f929')
sha256sums=('e04a6570a1b15319841d68946f59a9f9296b52c0776200a68663313ff447f538')

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
