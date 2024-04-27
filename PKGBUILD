# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GeoTcgaData
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('653a353d37b0bcfbd892dfe12d420100')
b2sums=('a399654762bf9d8360b0399aad14dd19bb7e8cbfcef49be3e6312b37a1976b178d74251c899b641423864c1a26e002d340412d03518919342587c39e1b1216a6')

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
