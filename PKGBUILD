# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Voyager
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="From geospatial to spatial omics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bluster
  r-ggnewscale
  r-ggplot2
  r-lifecycle
  r-matrixstats
  r-memuse
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
  r-ggh4x
  r-gstat
  r-hexbin
  r-rbioformats
  r-scater
  r-scattermore
  r-scran
  r-sfarrow
  r-sfedata
  r-testthat
  r-vdiffr
)
optdepends=(
  r-automap
  r-biocsingular
  r-biocstyle
  r-cowplot
  r-ebimage
  r-experimenthub
  r-ggh4x
  r-gstat
  r-hexbin
  r-knitr
  r-pheatmap
  r-rbioformats
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
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e36fbb30df3c719968b231fafd5dbd98')
b2sums=('6a075c04ce15737758f3cf5a4a6bd7986a97aab2886501e1ac846fac2be03c7a3d59973157f6b5dcb274a723826f990796edb36039f450bc780f7b29930dabe4')

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
