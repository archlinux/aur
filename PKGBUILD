# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=consICA
_pkgver=2.6.0
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
md5sums=('0438168fe9a893f920ebf526132d3546')
b2sums=('1dda705903c773443b82edd65fda56cb51a25363b45d2a3219619879a674b7c8a40d745e3342ee61def26c280f4baad3348278dad7b75f3d9d8bc3b037e69b73')

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
