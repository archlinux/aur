# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinymanager
_pkgver=1.0.410
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Authentication Management for 'Shiny' Applications"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('162ed86cdfc35e336387539da6891dc656835ab311ede9d1178e72b13f94f71d510b934fd8215901c42e91f32a7e2ef66566f07e819932633be01893f44442cc')

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
