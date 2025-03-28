# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CFtime
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Using CF-Compliant Calendars with Climate Projection Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-r6
)
checkdepends=(
  r-ncdf4
  r-stringr
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-ncdfcf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cb8725494d06bc912d8cece051530748')
b2sums=('fe1f993608749799f2f0bf471e8461e024ec841e99bf87a39ff99272f896f811d849bdba0808d781abfa32f983c6cd3e3ab0dec4a263744313ab574d02b2845c')

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
