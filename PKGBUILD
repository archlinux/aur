# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dreamerr
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Error Handling Made Easy"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-formula
  r-stringmagic
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('df2e0c5e9378f06e81f48a71389bb692')
b2sums=('80a031156c03db98cb76cdab2d962f6a3da0268a86bf0887519299c31c509fa33612e2ed06516b340f3279305063a3e460e416432a9122be6f3587dcf81cbc80')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tests_dreamerr.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
