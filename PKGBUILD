# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qmtools
_pkgver=1.16.0
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
md5sums=('884dbe9359586d512ddb4a4d3a1d210e')
b2sums=('daf7bcad6d6ffd7ef37314006b75eb925c845895d74075a0d4a390184ebc3f727b3a680501c7ced1c330ebc6e4d83179d74bd203f8a6c4cbf4214bb89c50780c')

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
