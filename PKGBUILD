# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymanager
_pkgver=1.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Authentication Management for 'Shiny' Applications"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-billboarder
  r-dbi
  r-dt
  r-glue
  r-htmltools
  r-openssl
  r-r.utils
  r-r6
  r-rsqlite
  r-scrypt
  r-shiny
  r-yaml
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-keyring
  r-knitr
  r-rmarkdown
  r-rpostgres
  r-sparklyr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f3bf2e80b10e22c3d680d3bee861c610')
b2sums=('75c97548cb37bc3f98a69c2b80bc936ce7f906c3e6f4882a78a8db8d2f40cab44a665d753ad58a8538fd3e948558020de7b5a8b68c47cba07ddffc68f11a469c')

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
