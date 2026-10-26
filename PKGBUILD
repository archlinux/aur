# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymanager
_pkgver=1.2.0
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
  r-later
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
  r-emayili
  r-fontawesome
  r-keyring
  r-knitr
  r-rmarkdown
  r-rpostgres
  r-sparklyr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e85f383ede96d8dadc3b01eebbc1794')
b2sums=('de564c0cee5026a1cd8957eb974e13c70126ad41fd34ef32a2c4e9945140d50153394981c049fe28dff9fff3426741fc9dab6a2c81c47fc287fb2c33ad6d6881')

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
