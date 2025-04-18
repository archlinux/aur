# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=IFAA
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Robust Inference for Absolute Abundance in Microbiome Analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-desctools
  r-doparallel
  r-dorng
  r-foreach
  r-glmnet
  r-hdci
  r-mathjaxr
  r-matrixextra
  r-parallelly
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a2f97e23b43b0934a0bf5dfda138082')
b2sums=('2ebcad5c97ddfb91cb1568e4cb213f0315515c3b774010672eaf08b8ad4ad779ea6da68a37a7af67ffc119b198a2b7ef6d0b261980de974a058a208fa56aa857')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
