# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=palr
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Colour Palettes for Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
checkdepends=(
  r-raster
  r-stars
  r-testthat
)
optdepends=(
  r-covr
  r-knitr
  r-raster
  r-rmarkdown
  r-stars
  r-testthat
  r-viridis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a58440cad133ba506d936d997b82cdc0')
b2sums=('a4a22488c04c1260da05f1796700d4444f82c8d8baac3b61b0a3661567ab85deda489494110390dc131a3cd6fc9491ed811d5abb218b68e62c54da87d58e5a66')

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
