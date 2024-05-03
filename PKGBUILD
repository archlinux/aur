# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=partCNV
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infer locally aneuploid cells using single cell RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationhub
  r-data.table
  r-depmixs4
  r-genomicranges
  r-magrittr
  r-seurat
  r-singlecellexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-iranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ae8c50053b7b72400a754ffd2039e96')
b2sums=('720abd685db51e1c5d92a53ee183cf3bd737995aacf3542737addc3a75289e91d3dff9a2f4c3c54b4dcfed0b0af97d5c552b680164f7ac06cb18a48071ed7119')

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
