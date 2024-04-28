# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=katdetectr
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-scales
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ae9895a26f752a9e8502913ef8ce410')
b2sums=('98a52aedb883f15e1ee8697f32cb691de17e1c6d2bfc225177b9b402f5a0c88e27d4c96123dea516443bb9ea0c0196d1269e2a8eddd0354076e52e9e19cccd3e')

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
