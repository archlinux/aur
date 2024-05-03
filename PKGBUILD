# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GeoTcgaData
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing Various Types of Data on GEO and TCGA"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-cqn
  r-data.table
  r-plyr
  r-summarizedexperiment
  r-topconfects
)
checkdepends=(
  r-clusterprofiler
  r-edger
  r-limma
  r-org.hs.eg.db
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-catt
  r-champ
  r-clusterprofiler
  r-dearseq
  r-deseq2
  r-edger
  r-enrichplot
  r-geoquery
  r-illuminahumanmethylation450kanno.ilmn12.hg19
  r-impute
  r-knitr
  r-limma
  r-minfi
  r-noiseq
  r-org.hs.eg.db
  r-quantreg
  r-rmarkdown
  r-s4vectors
  r-tcgabiolinks
  r-testthat
  r-tidyr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f1e44cea05303ee8bca09536c601158')
b2sums=('eb69c7feabbb98744fb85c90570c0ebe968f00d66439ae488dce66b749b5f8c1b3cd0fe8ca62985616aee97569fd526055363322f259d9bbac5de01fa83535dc')

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
