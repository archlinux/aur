# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.files
_pkgver=1.6.0
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
md5sums=('c1b2dba95dd7cb7ed3be0eda1914258e')
b2sums=('08f134612e2f705e40b476c67e6b8f76265d51a20a3777c1f8e7e96b282eeb805b966bc00a60cdbb836461d38d414d50e1aec55b1cf22da2bf4715a7c16a2c39')

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
