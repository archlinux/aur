# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seq.hotSPOT
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Targeted sequencing panel design based on mutation hotspots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-hash
  r-r.utils
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
md5sums=('afe353f38d5ed43da4c53adb6c100a9a')
b2sums=('2fcdd8f60a775c3d998021c96d0a378703f8f83b237de9acd08391fb8e79dc0f86469c0c9c8d2e8cc8878ab1b9b3cc1a202412b447e0c3641f131598c252506e')

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
