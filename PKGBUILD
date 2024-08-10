# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=biodbHmdb
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a library for connecting to the HMDB Database"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('AGPL-3.0-only')
depends=(
  r-biodb
  r-r6
  r-rcpp
  r-zip
)
makedepends=(
  r-testthat
)
checkdepends=(
  r-xml2
)
optdepends=(
  r-biocstyle
  r-covr
  r-devtools
  r-knitr
  r-lgr
  r-rmarkdown
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8037d11754cc83f4d292fb2996ae51e7')
b2sums=('bbcc8837e533f2ff60101f70882ee18b6c00acd274fdfe3a2f717fe2209a04a0d982b94a5341e43186ca50fe00b5e8250ade6b85d2829cb4ff999db022ddc435')

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
