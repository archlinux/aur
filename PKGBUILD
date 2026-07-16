# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=consICA
_pkgver=2.10.0
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
md5sums=('b3f790619bd3d2557236aa1bc3fbcae5')
b2sums=('43313db299deec90596d2912df4eba8a554ee8b8cdb61bb3773bbddf443268966380c3bb8cdc17f42277c87b21560342e2543010ada2f4b3e38e6749df2cbf83')

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
