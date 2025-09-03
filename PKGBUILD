# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=gargle
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for Working with Google APIs"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-fs
  r-glue
  r-httr
  r-jsonlite
  r-lifecycle
  r-openssl
  r-rappdirs
  r-rlang
  r-withr
)
checkdepends=(
  r-httpuv
  r-sodium
  r-testthat
)
optdepends=(
  r-aws.ec2metadata
  r-aws.signature
  r-covr
  r-httpuv
  r-knitr
  r-rmarkdown
  r-sodium
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3a5005fcbb6cd1cfb2d5fd77b60a1847')
b2sums=('b3c259d650553c25b5bd492eeaefecfb944bf12f68be92cc3c2c957819056870ca6e16ebe70f7a2fa616813bbc45cfba6c55130b9f7da620d677e306a8596cdc')

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
