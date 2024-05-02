# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FeatSeekR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R package for unsupervised feature selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pheatmap
  r-pracma
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dmelsgi
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('82b91044da7aced20831d15c44fbf07f')
b2sums=('188a0620c0c43f071f390fa03b5f89bd9b31dceed43b805ae1fc0eef5bfd197130a5565a94bc4ab6429067ca63160480d86de67b174e37a149b993aa876eaae3')

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
