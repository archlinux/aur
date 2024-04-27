# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=partCNV
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('e004f2129cbb1fe1e84e33cf223c06f6')
b2sums=('51ed457d79c7f0692d8ea0bbedf0f87e3c3fe8edab5dd10bccc61bd053a0cb8478c9b9eee0405f19063fdf57ca65592b965881f53da82582bc78701f103b04d1')

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
