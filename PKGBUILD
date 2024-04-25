# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SUITOR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Selecting the number of mutational signatures through cross-validation"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocparallel
  r-ggplot2
)
checkdepends=(
  r-biocgenerics
  r-runit
)
optdepends=(
  r-biocgenerics
  r-biocmanager
  r-biocstyle
  r-devtools
  r-knitr
  r-mutationalpatterns
  r-rmarkdown
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f4a5ea607ef7551025cf8b425d20bc7')
b2sums=('8250bcc328ee54c887bfdaccee09c63c082593809ae3ebbed5dbdbc9543957b4ad1accaaaf2a0cf696b85242ec0353ed6ee78c7511225f99f9a48d6a4166c2da')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
