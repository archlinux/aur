# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rmzqc
_pkgver=0.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creation, Reading and Validation of 'mzqc' Files"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-jsonlite
  r-jsonvalidate
  r-knitr
  r-ontologyindex
  r-r6
  r-r6p
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('59234a876928a14bad060c8dcb346284')
sha256sums=('afa6b742eebfaa04a4597b3679b29b7751eeddce612f5f40904b1f47fa06e470')

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
