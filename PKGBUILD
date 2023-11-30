# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggtreeDendro
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Drawing 'dendrogram' using 'ggtree'"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ggplot2
  r-ggtree
  r-tidytree
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-aplot
  r-knitr
  r-mdendro
  r-prettydoc
  r-pvclust
  r-rmarkdown
  r-testthat
  r-treeio
  r-yulab.utils
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e5839d466e08665eb2475a99fb74e833')
sha256sums=('ace77cc34d998168e516ef377b563d49d9d8895135fdc6cdb9359544f6b2df3e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
