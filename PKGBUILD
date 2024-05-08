# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.files
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Wrappers to Save Common File Formats"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.base
  r-biocgenerics
  r-rsamtools
  r-s4vectors
)
checkdepends=(
  r-testthat
  r-variantannotation
)
optdepends=(
  r-biocstyle
  r-biostrings
  r-knitr
  r-rmarkdown
  r-rtracklayer
  r-testthat
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e979232b1276c91f64db8987e2d73172')
b2sums=('ba7dd5d2e95383c807640a02040b33c9c3f4ad50651318cbff050ee48d8f67c05d191adff94aa7579f95f3a6af414176988d581b877f0e445b52cf0f09c0bfc7')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
