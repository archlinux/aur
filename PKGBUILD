# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggtreeDendro
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Drawing 'dendrogram' using 'ggtree'"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
md5sums=('defc1f45bc699d6ef9d433146de0c62d')
b2sums=('cc3d6fd9abef25d42201743405030a98c0fe7dd41df9d35c8a6c2cf227205033ca4fcd3522748f822a513b55df441dca06341c28801dad3fe3cef977fefd3c77')

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
