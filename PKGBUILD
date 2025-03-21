# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=katdetectr
_pkgver=1.8.0
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
md5sums=('b82e34bb3c3d447ca1899d32dd214f1d')
b2sums=('465184cf790a851c77d4f87f4eaa539c2c24e7adcd537e669e33ed5131217d64e34c02fd339ce3fdbf9aab79b04a106b38d066bb70e4935036a9b99a74c7c6a3')

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
