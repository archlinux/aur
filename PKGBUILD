# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=phantasusLite
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Loading and annotation RNA-seq counts matrices"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biobase
  r-data.table
  r-httr
  r-rhdf5client
  r-stringr
)
checkdepends=(
  r-geoquery
  r-testthat
)
optdepends=(
  r-biocstyle
  r-geoquery
  r-knitr
  r-rhdf5
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d91992a4871bae09abfd2ac02147be76')
b2sums=('06c9a8477a50c1dbad3f0351878b4726b283b0447e7d7473b285076e84e0f97b70e7460268cd0ba39f16b3279038e7cca41ee97038d4809b98b3738ad9fab489')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
