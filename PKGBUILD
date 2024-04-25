# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidylog
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Logging for 'dplyr' and 'tidyr' Functions"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-clisymbols
  r-dplyr
  r-glue
  r-tidyr
)
checkdepends=(
  r-forcats
  r-testthat
)
optdepends=(
  r-bench
  r-covr
  r-forcats
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17c4e3a5589ac9a1a0653ba54e979d52')
b2sums=('74b34c2d2c510f5061da626c59176f896f8d8dc455115b3a34beb1b360172e4d0220c2b8d020813b99119f5dc19d56356ee1c6ca4ee1cfb0e2f32ddf1a698500')

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
