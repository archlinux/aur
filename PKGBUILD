# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=qpdf
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Split, Combine and Compress PDF Files"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  qpdf
  r-askpass
  r-curl
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('97f19fbd5fc43ec9aff284ca77069036')
b2sums=('1118ca54be0a3aa7188a10f7994eb11583702d907d6608f36c3ff3f5bc7427d57a2166159f3b03c85ae971a9f325117e5cade5e36c6622fda5ca21075da41c90')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname" \
      --configure-vars=EXTERNAL_QPDF=yes
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
