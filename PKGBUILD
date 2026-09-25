# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxSNP
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scRNAseq demultiplexing using cell hashing and SNPs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-demuxmix
  r-dplyr
  r-ensembldb
  r-iranges
  r-kernelknn
  r-matrixgenerics
  r-seqinfo
  r-singlecellexperiment
  r-summarizedexperiment
  r-variantannotation
)
checkdepends=(
  r-ensdb.hsapiens.v86
  r-seurat
  r-testthat
)
optdepends=(
  r-biocstyle
  r-complexheatmap
  r-dittoseq
  r-ensdb.hsapiens.v86
  r-ggpubr
  r-knitr
  r-refmanager
  r-rmarkdown
  r-seurat
  r-testthat
  r-viridislite
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ea1ef1a5940c497d4a4599e039ec6129')
b2sums=('4aa37237dbde5626008661502e179cc5eb0b44228b88d0c4e4ffe6fbbe2956c8ba4357bf2315287fc8e14cf735dbc89ffe3fa1b70ef6b6826b8ea528b1e70a81')

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
