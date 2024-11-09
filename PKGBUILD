# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=consICA
_pkgver=2.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('929848b8c5a45ff0ea43c42e500e6599')
b2sums=('cc7267406d8027ab1c50c89ac56ee0909c24932841390fd1bf9c66f53eaa7990e89db73af8647b417bbab4fd890c406bd112404afacc07158f66513ea55ed77a')

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
