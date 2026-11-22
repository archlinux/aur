# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ISLET
_pkgver=1.14.0
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
md5sums=('45ce1aaaa8768de0e31e8a0a4ed3cb7e')
b2sums=('62397fc3cc1700228394719b0c685e5d268caa82201fe5a97149c29ea97e793cc74da34e3f62c55f543591fee8bcaa2fbc503642c8bb5b98073be8cd651926ea')

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
