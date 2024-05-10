# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendMsp
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mass Spectrometry Data Backend for NIST msp Files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-iranges
  r-mscoreutils
  r-protgenerics
  r-s4vectors
  r-spectra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c1449c171d9dbb52f4a1f3815716b86')
b2sums=('0c395932dfbccac200fbb1a2e54bac293de9513a052e19b4bb11a5bc0d770030f0146c1787729b76517a991274ecab4c9236b36a8be1cda73a878fbf85b60230')

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
