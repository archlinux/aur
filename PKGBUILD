# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=gargle
_pkgver=1.7.0
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
  r-r6
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
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9fa47dd8abb7187360f09c9a48261ab')
b2sums=('2c2d3cc9989ee11dc0009cec1479ec31a403dde1d70ddd9a183e36ae65dcfb732479c18b5c44c79e8645ab3b8eb6d59585c378e40cd061f2016c24f510290ff9')

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
