# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=redux
_pkgver=1.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="R Bindings to 'hiredis'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  hiredis
  r-r6
  r-storr
)
checkdepends=(
  r-sys
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-sys
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13eb2a35ff97ad02e09b1e42ec8cff7c')
b2sums=('7f92928ecb8fac5feac29169ad2ca086b2539c661dd459e2f82b51b0f0dfd643e42e37a353c4eeeb3de5f51f33d702da50f7c604ee9f62de38de6344dff1f8c5')

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
