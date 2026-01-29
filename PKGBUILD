# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=gargle
_pkgver=1.6.1
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
md5sums=('a0ca8a66d77f1417539ad13bb3e85b5d')
b2sums=('9b735551b157178a8ed70cbb41741ba38341cb26a10828f37ef24980dcfda523795a85a978a2c453ab74277f8160861e9c8a7d393ca4be0b1c08cbc20c08887b')

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
