# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=vsclust
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Feature-based variance-sensitive quantitative clustering"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-clusterprofiler
  r-dose
  r-httr
  r-limma
  r-matrixstats
  r-multiassayexperiment
  r-qvalue
  r-shiny
)
makedepends=(
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7ec83c3777459f80e8649ed7ba6a305b')
b2sums=('6ed32b192d6815b2b94768824e15a4f5402b96cb3b1e43b35817ed71f60a384e77d8816ae2b2439f011419b96a8170eec70fffc25a07e6f0e5e6bb40d70103b2')

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
