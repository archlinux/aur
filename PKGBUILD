# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EpiMix
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('d86305c56618b7f327d0068e09ad6558')
b2sums=('e741fd7c2218a78e91b6fbe38fe347d83972214da5304e32b061af27772b848bf429e3426d48c91eb19ed17e061c0155e20f45edb4971ee96c0730c023cf3234')

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
