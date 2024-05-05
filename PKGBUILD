# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix
_pkgver=1.6.1
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
md5sums=('eabf88cbeaf4f32228191f3a389c880a')
b2sums=('d1c3f93e97ecc9a568cf57d47961fc89c43eaf577801275efd50ee1082711647bc637b9e8fb522abc918d9e747052dcffbeab87b756af3430df451b89d9364b3')

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
