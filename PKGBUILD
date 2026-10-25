# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Alex Branham <branham@utexas.edu>

_pkgname=rio
_pkgver=1.3.1
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
  r-qs2
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
md5sums=('2d8312cecc919316737440c6c56284dc')
b2sums=('d31b9ad0ae49fc4c1a3c727806deb1db5faa15f36fe77f712a3747ddd6acc431123cdb943fda9c90597749f5385f458783c9e2b143a2f9d16449f5ac2056536c')

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
