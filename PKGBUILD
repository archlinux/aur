# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=FeatSeekR
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="an R package for unsupervised feature selection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-pheatmap
  r-pracma
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7c71a026c10b2799a785c3d066580780')
b2sums=('efd777232b83be2a86ed4ad5218edf4ca2478e5eaed00e5e1302eeec4600eec791933fdeb2fd572078481b08821247922b0a4671ba42743c945e96e01dd29fcb')

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
