# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxSNP
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="scRNAseq demultiplexing using cell hashing and SNPs"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocgenerics
  r-combinat
  r-demuxmix
  r-ensembldb
  r-genomeinfodb
  r-iranges
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
md5sums=('66a0ed302acbc18c7a106d99bf645133')
sha256sums=('8cd8919bec139b2d6f0dd33cc4b806617e41483f645f70bf2e85cbff4a447aa0')

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
