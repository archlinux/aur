# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=katdetectr
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection, Characterization and Visualization of Kataegis in Sequencing Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocparallel
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-changepoint
  r-changepoint.np
  r-checkmate
  r-dplyr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-ggtext
  r-iranges
  r-maftools
  r-plyranges
  r-rdpack
  r-rlang
  r-s4vectors
  r-scales
  r-tibble
  r-tidyr
  r-variantannotation
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3e7beaf0916d9a3d8dd97c74fd3f8543')
b2sums=('0ad3475b9dc7e02e420de8402cdd2ff8d6e277577ec43b50e2682875ce7f0397985e894aad8568b11e31fee69775f0cca8d562cde79d234c0740c09b4106b7c2')

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
