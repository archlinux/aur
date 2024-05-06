# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxSNP
_pkgver=1.2.0
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
md5sums=('696b03cdca6d6ff4288288ca4e8a636d')
b2sums=('2a6ae121f0592df9f936bf6bc48a4408f9d6dae89d4448edc0c7abb517e74c9d08ec6b467bfa1288ed2abdc7d07bb12262da9c7e6fea3e27bd2472dcb8cdce84')

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
