# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix
_pkgver=1.10.0
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
  r-genomeinfodb
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
md5sums=('d0681128378b5066107a293e0202d38a')
b2sums=('9ef9b222ff3d427a120e76b2a9b13eab197d340c45489d9762c7d6d2116e1fe41a9b8fc8049fe1a692c76d439aae2cbfae6ca5878e4761cfe6315d44e97410dd')

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
