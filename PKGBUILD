# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=rio
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
  r-readxl
  r-stringi
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
  r-readr
  r-rmarkdown
  r-rmatio
  r-testthat
  r-xml2
  r-yaml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('10999152910a11bcccc2b85e78cfda4f')
b2sums=('dfe07373a3c0430a651de382a4ba13e3d079ff4e63cb9f51752e3314cf3dc1eec849039c737213983efd1b2a92e60752adfe65e9743d2bcd8917f27e660d7602')

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
