# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsBackendMsp
_pkgver=1.12.0
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
md5sums=('77951b1e6ac0a91ddf04005372b6d76f')
b2sums=('5dcf59c2690ea9d986b94a2da105e99a33a42a363456b6bbc0cd9324d1829156de70cb3b4a49416e4ea980a2f7e6172acb399b80879974cc6655122ffc68a86e')

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
