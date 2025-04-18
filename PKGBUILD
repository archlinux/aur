# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qmtools
_pkgver=1.12.0
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
md5sums=('2bdae137cef39a1072a8a777e168d056')
b2sums=('1d43014dd8924185844ac81401b7fc858b53ab33a4b93b92275372a7a43ba6617f715fc40cfa53690387c725ccbe212b0465efcd80e097607664defe1c470404')

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
