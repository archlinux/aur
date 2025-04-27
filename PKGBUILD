# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxSNP
_pkgver=1.6.0
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
  r-genomeinfodb
  r-iranges
  r-kernelknn
  r-matrixgenerics
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
md5sums=('d2d97bd74bbce29c9fd2366ec5cb764b')
b2sums=('216b6761c6aa0e27c20c25f8c789ef05b413167d4de9d01f3939f1601599567a0611791334776aa4d7ff4dfdaf38a8f5a4c060f1dff3509859fd45fe5dc54825')

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
