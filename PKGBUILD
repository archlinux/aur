# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=GloScope
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Population-level Representation on scRNA-Seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-fnn
  r-ggplot2
  r-mclust
  r-mvnfast
  r-rann
  r-rlang
  r-singlecellexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-zellkonverter
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa0a9f03406b2d71558c5c0fab37a7f5')
b2sums=('1c4e676847eac42231b66b5aa2e8cc12a2ac750cfcc517158617d9188845e8ba994d72be260da02523c761419f54dcb6331e85639fdae2ee02a265a6822b4586')

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
