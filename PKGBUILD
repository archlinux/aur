# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rmzqc
_pkgver=0.7.0
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
md5sums=('8540ea51954eac00caffc9fc53d70290')
b2sums=('ec08f7d7e8bf723ee984a85dd50c6c4318e625cabd3b6f38472e4c627f86e007ff4024216001ebb6f791749e6f9090cbe9c1b8b7af98d1bd1df1d5dbf17d80de')

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
