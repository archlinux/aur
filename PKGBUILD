# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxSNP
_pkgver=1.4.0
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
md5sums=('3b31e85995d4a7c5a2f43a26bc515cfe')
b2sums=('ed1e28739f08c4ef17e83dee59439141c23c9ea00b47c417e50250a6de9c24a1d48c149b8b229b87d583abec74d65904dfde9bb91fc89c7f3924a32e3b3458e3')

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
