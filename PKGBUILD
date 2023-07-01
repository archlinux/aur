# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=gargle
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Utilities for Working with Google APIs"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
md5sums=('ffbccb99846ff6eec001a12cd740f811')
sha256sums=('e3ba27b5405de5fe06c8d245a6b357d291ed0cbaeab54c807e5ceee83efcb9a5')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
