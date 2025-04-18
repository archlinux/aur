# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GeoTcgaData
_pkgver=2.8.0
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
md5sums=('378109372ff0e30f980d42dbd16b83bc')
b2sums=('9a56aef5ca0a10b7913e177ceaf2e445ae92d7101b1cd15eec61be8f511a6dfbb7151df8617473ad001d6c581f5b62abccf2d78f0de7f42cc923178b25f604dd')

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
