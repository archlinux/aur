# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biodb
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a Library and a Development Framework for Connecting to Chemical and Biological Databases"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-chk
  r-fscache
  r-jsonlite
  r-lgr
  r-lifecycle
  r-openssl
  r-plyr
  r-progress
  r-r6
  r-rappdirs
  r-rcpp
  r-rsqlite
  r-sched
  r-sqlq
  r-stringr
  r-withr
  r-xml
  r-yaml
)
makedepends=(
  r-testthat
)
checkdepends=(
  r-xml2
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('67d07af59a171de80e1135a9207d71fd')
b2sums=('b5ac10863aac68810e50269a2fa742dcc75470a0e485ef8d3a4fb07f9e7fa138b08960447f5c9b30450538b2696a650b601ffced46d4e1ee34eb427a79e7aca0')

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
