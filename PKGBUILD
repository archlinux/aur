# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=rio
_pkgver=1.1.0
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
md5sums=('a2c0c95c95553f4f0b19e1ed42d4464c')
b2sums=('598938bdbc29b4470a2df661ef4d954f7d1f57e7d658f5b85561e7dc222188bf3beb89d058d2e6d276b0eca72cb2da8b9745cf7bbf2c705c2989f90dc1cef03b')

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
