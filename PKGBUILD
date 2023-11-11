# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymanager
_pkgver=1.0.410
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Authentication Management for 'Shiny' Applications"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-billboarder
  r-dbi
  r-dt
  r-htmltools
  r-openssl
  r-r.utils
  r-r6
  r-rsqlite
  r-scrypt
  r-shiny
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-keyring
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d5c4711312e295b09dcdd35cdac7ba88')
sha256sums=('b6cd31149aaffd81d181a0c2f19eee8963b32912b3df1149e56448fe9a38865a')

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
}
