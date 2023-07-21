# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=gargle
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('d18b3d01e31e0dd4f4482aed5b85dc9c')
sha256sums=('4a5beb046eb50a168b4baf5d1fcd8ac20d698e7fcb6b6ef46a436ded5b039001')

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
