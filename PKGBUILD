# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rmzqc
_pkgver=0.5.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creation, Reading and Validation of 'mzqc' Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-jsonlite
  r-jsonvalidate
  r-knitr
  r-ontologyindex
  r-r6
  r-r6p
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7819309b6b845852bb5db64753824c05')
b2sums=('0169164d31003ca85dca383f7e6431360a2dec36cbfcdcd6e299929f02398f9422a961055910fb33962550aff3f64c200ed2ac9ed712b4d71920691fc4016613')

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
