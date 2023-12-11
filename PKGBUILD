# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MobilityTransformR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Effective mobility scale transformation of CE-MS(/MS) data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-metabocoreutils
  r-msnbase
  r-spectra
  r-xcms
)
checkdepends=(
  r-msdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-msdata
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1d0f7904be49e25235092248b757df19')
sha256sums=('3091172dc69b9eaa26befeafba4dc836c1b45ffbdb14d920703fc48fc0742289')

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
