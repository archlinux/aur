# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=seq.hotSPOT
_pkgver=1.14.0
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
md5sums=('e6fe0f8ccc6d90c3d06bb186c912d73c')
b2sums=('35713c517acda0837a475b92ab79d0c8d1698c72ae565fa9ef3a06037be31dd0f102d4378097aaeb2e4ff1f62a5c2d8559215ebc2ee25a8bf605372e264ebf4e')

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
