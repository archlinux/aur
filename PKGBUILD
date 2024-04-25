# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seq.hotSPOT
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('37e04dc7e1bb05af58c50cb7701388c7')
b2sums=('085b5706f92bd5fac7d5c40e4639198ea4a6b6bcde999b67618412736803b4ece570648142a20251a8bbac3ca4b42661be81b9e5de6f20d01ea0b8425fd7f2e7')

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
