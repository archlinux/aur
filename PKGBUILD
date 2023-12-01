# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=katdetectr
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Detection, Characterization and Visualization of Kataegis in Sequencing Data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('3f5d04a60a2d8ff0d9db9ebcbc52347dc046ac25f2327eed5c98421bd7c12a44')

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
