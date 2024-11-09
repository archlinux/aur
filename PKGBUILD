# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qmtools
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative Metabolomics Data Processing Tools"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ggplot2
  r-heatmaply
  r-igraph
  r-limma
  r-mscoreutils
  r-patchwork
  r-rlang
  r-scales
  r-summarizedexperiment
  r-vim
)
checkdepends=(
  r-impute
  r-imputelcmd
  r-missforest
  r-msfeatures
  r-pcamethods
  r-pls
  r-rtsne
  r-testthat
  r-vsn
)
optdepends=(
  r-biocstyle
  r-impute
  r-imputelcmd
  r-knitr
  r-missforest
  r-msfeatures
  r-pcamethods
  r-pls
  r-rmarkdown
  r-rtsne
  r-testthat
  r-vsn
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6faa442b1949dd6c8af47c5285b455a7')
b2sums=('a7e1fc764e4dc8172a8c7735109be3ca5b932702010d0196614f5edb5189d379d3a5bce57086288200bfd55ed37cf166140cd789cee3ff2cd81f7fee5fb63e32')

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
