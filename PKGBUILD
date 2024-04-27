# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=consICA
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="consensus Independent Component Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-fastica
  r-ggplot2
  r-go.db
  r-graph
  r-org.hs.eg.db
  r-pheatmap
  r-rfast
  r-sm
  r-summarizedexperiment
  r-topgo
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b64f871ca062dc65d6a883b000c761d8')
b2sums=('6c06df7a4b254a1546391f0185f99790fa860056a6373ed44a6ff17b7e929cbf978ae05153ae0e7bdcf476525586a93093ac3c7e1187f7f86de35420b9336218')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
