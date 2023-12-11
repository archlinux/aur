# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qmtools
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative Metabolomics Data Processing Tools"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('941d7cbf1dc8c2622fe97bda18a2bf49')
sha256sums=('05e034d0f53c71d3e6681d5b712ff1722847b98b62fffd65168a21aa7929245c')

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
