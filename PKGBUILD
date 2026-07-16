# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an integrative tool for the population-level analysis of DNA methylation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-annotationhub
  r-biobase
  r-biomart
  r-data.table
  r-doparallel
  r-dosnow
  r-downloader
  r-dplyr
  r-elmer.data
  r-epimix.data
  r-experimenthub
  r-foreach
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-impute
  r-iranges
  r-limma
  r-plyr
  r-progress
  r-r.matlab
  r-rcolorbrewer
  r-rcurl
  r-rlang
  r-rpmm
  r-s4vectors
  r-seqinfo
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
checkdepends=(
  r-biocgenerics
  r-runit
  r-sesamedata
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-clusterprofiler
  r-dt
  r-geoquery
  r-karyoploter
  r-knitr
  r-mirbaseconverter
  r-multimir
  r-org.hs.eg.db
  r-regioner
  r-runit
  r-seurat
  r-survminer
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9cfc3c222802f2bc91b77f7514793d17')
b2sums=('2107235118cdd9dd4617ab27a717670772ccf9ba2a932ed00fecd3516ed6752c489019302ae8c36e8ca0e8a0fb33c0b4af6c1c60ec716357e197d1b6fb6f0866')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
