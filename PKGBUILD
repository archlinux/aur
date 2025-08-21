# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=exactci
_pkgver=1.4-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Exact P-Values and Matching Confidence Intervals for Simple Discrete Parametric Cases"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ssanv
  r-testthat
)
optdepends=(
  r-blakerci
  r-exact2x2
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('76eaf0911880f60470dd4c3e11f2d797')
b2sums=('edb0f0c3063b2f7b7f3f085e6bcf48636ea209711b1e232346c53898163bf37344d58fe3528353649dd05bb3be073459ff5c1019953c82415c464eb459a83fac')

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
