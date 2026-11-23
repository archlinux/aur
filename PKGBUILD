# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GeoTcgaData
_pkgver=2.12.0
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
md5sums=('cc545389779d90f334d1385891fbbf63')
b2sums=('9479ec998a7d5147d525e866801cea6425f72f01c41aafc98a85be6a398134592e7f0963ffa386aebedc8e6f1ebc9a8af1edb0c86f6a36c5fa7b20b2da5e9b5f')

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
