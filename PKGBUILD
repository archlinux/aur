# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GeoTcgaData
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing Various Types of Data on GEO and TCGA"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('463ef0f64e092337495a3f6da55b224a')
sha256sums=('314062425c9e61fc002de591495c9fa57821fe8163c0e41542d7d0c14f4d6f39')

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
