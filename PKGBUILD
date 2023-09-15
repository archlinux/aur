# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=rio
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Swiss-Army Knife for Data I/O"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-arrow
  r-curl
  r-data.table
  r-haven
  r-lifecycle
  r-r.utils
  r-readxl
  r-stringi
  r-tibble
  r-writexl
)
checkdepends=(
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
  r-readr
  r-rmarkdown
  r-rmatio
  r-testthat
  r-xml2
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c86e6ce7c8ab4ada6873f5bc3eb5355')
sha256sums=('46cf804b04a0525f444c5173c564db651029387dc8fa6857e5b2ea5f737ee586')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
