# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=qmtools
_pkgver=1.8.0
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
md5sums=('8f2150752b2c68e94fa6b7e19e36d980')
b2sums=('de5c7a9afd276c7307e41791dc6ea3aaf303013269adefaaaaa0d389583c3de585f2781e482a4058ac769eb0f148d570dcd6b88ec7499c507030b8dd4d4d978e')

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
