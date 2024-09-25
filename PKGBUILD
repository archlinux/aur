# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=rio
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Swiss-Army Knife for Data I/O"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-curl
  r-data.table
  r-haven
  r-lifecycle
  r-r.utils
  r-readr
  r-readxl
  r-tibble
  r-writexl
)
checkdepends=(
  r-arrow
  r-fst
  r-hexview
  r-nanoparquet
  r-pzfx
  r-qs
  r-readods
  r-testthat
  r-xml2
  r-yaml
)
optdepends=(
  r-arrow
  r-bit64
  r-clipr
  r-fst
  r-hexview
  r-jsonlite
  r-knitr
  r-magrittr
  r-nanoparquet
  r-pzfx
  r-qs
  r-readods
  r-rmarkdown
  r-rmatio
  r-stringi
  r-testthat
  r-withr
  r-xml2
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('333f6e1b3624b7722c5b6896e2d59120')
b2sums=('b475b35fe1eca48dca8ae7f67a2296a63bb17c2fb0da7cefc0c671f98dfd04e44c193935d06320fa4427e3a8dacc8bc4b1eab44cec384fa02d02522f73b1c3fa')

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
