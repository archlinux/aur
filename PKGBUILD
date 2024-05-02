# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ISLET
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Individual-Specific ceLl typE referencing Tool"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-abind
  r-biocgenerics
  r-biocparallel
  r-lme4
  r-nnls
  r-purrr
  r-summarizedexperiment
)
checkdepends=(
  r-runit
)
optdepends=(
  r-biocstyle
  r-dplyr
  r-htmltools
  r-knitr
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3f20f6f9e207ab5f955a3f3f52eff688')
b2sums=('941da50f4c7e91371501dd32c0812b8e22db6905adfedbe40985aa644c0f2b0c5990ec4117031a6d8df724e2ed0ecee390fda9c3b4920ac1dc5a12b09d67cd06')

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
